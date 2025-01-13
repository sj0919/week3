// import 'dart:io';
import 'package:flutter/material.dart';
// webview
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// Permissions
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

// Flutter App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoseTracker Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF000000),
        secondaryHeaderColor: const Color(0xFF000000),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PoseTrackerPage(title: 'PoseTracker Demo'),
    );
  }
}

class PoseTrackerPage extends StatefulWidget {
  const PoseTrackerPage({super.key, required this.title});
  final String title;
  final textMsgStyle = const TextStyle(color: Colors.black, fontSize: 18);

  @override
  State<PoseTrackerPage> createState() => _PoseTrackerPageState();
}

class _PoseTrackerPageState extends State<PoseTrackerPage> {
  // Constants
  final String API_KEY = "75d3c7f5-0533-429c-a137-2ae8a47dd10c";
  final String POSETRACKER_API_URL = "https://app.posetracker.com/pose_tracker/tracking";
  final String exercise = "squat";
  final String difficulty = "easy";
  final bool skeleton = true;
  final int width = 350;
  final int height = 350;
  final int counter = 0; // Counter for exercise repetitions
  int _totalCount = 0; // Total count of repetitions

  // States
  String _displayText = "";
  String _api_url = "";

  // instances in use to configure js bridge and permissions
  late PlatformWebViewControllerCreationParams params;
  late WebViewController _webviewController;

  @override
  void initState() {
    super.initState();

    // Initialize URL and text
    _api_url = "$POSETRACKER_API_URL?token=$API_KEY&exercise=$exercise&difficulty=$difficulty&type=$_totalCount&skeleton=$skeleton&width=$width&height=$height";
    _displayText = "Waiting for API Data...";
    _requestCameraPermission();

    // Configure JS in WebView depending on platform
    if (WebViewPlatform.instance is WebKitWebViewPlatform) { // iOS
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else { // Android
      params = const PlatformWebViewControllerCreationParams();
    }

    // Initialize WebController
    _webviewController = WebViewController.fromPlatformCreationParams(params);

    // Configure specific params for Android
    if (_webviewController.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      AndroidWebViewController ctrler = (_webviewController.platform as AndroidWebViewController);
      ctrler.setMediaPlaybackRequiresUserGesture(false);
      ctrler.setJavaScriptMode(JavaScriptMode.unrestricted);
      ctrler.setOnPlatformPermissionRequest((request) {
        request.grant();
      });
    }

    // Add JavaScript Bridge
    _webviewController.addJavaScriptChannel(
      "flutterJsMessageBridge",
      onMessageReceived: (JavaScriptMessage javaScriptMessage) {
        setState(() {
          // Parse the message from WebView (assume it sends the repetition count)
          try {
            final parsedData = int.parse(javaScriptMessage.message);
            _totalCount = parsedData;
            _displayText = "횟수: $_totalCount";
          } catch (e) {
            _displayText = "Error parsing data: ${javaScriptMessage.message}";
          }
        });
      },
    );

    // Set navigation delegate for WebView
    _webviewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            _displayText = "Loading...";
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _displayText = "Page Loaded";
          });
          _webviewController.runJavaScript("""
            javascript:(function() {
              let squatCount = 0;

              // PoseTracker에서 스쿼트 동작 감지 이벤트 연결
              if (window.poseTracker && typeof window.poseTracker.on === 'function') {
                window.poseTracker.on('squatDetected', function() {
                  squatCount++;
                  flutterJsMessageBridge.postMessage(squatCount.toString());
                });
              } else {
                console.error('PoseTracker API가 로드되지 않았습니다.');
              }
            })();
          """);
        },
      ),
    );
  }

  void _requestCameraPermission() async {
    var status = await Permission.camera.request();

    if (status.isGranted) {
      print("Camera permission granted");
      _initializeWebView();
    } else {
      print("Camera permission denied");
      setState(() {
        _displayText = "Camera access denied. Please allow permissions in settings.";
      });
    }
  }

  void _initializeWebView() {
    _webviewController.loadRequest(Uri.parse(_api_url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            // WebView
            Expanded(
              flex: 3,
              child: WebViewWidget(controller: _webviewController),
            ),
            // Status and Count Display
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "횟수:",
                      style: widget.textMsgStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$_totalCount",
                      style: widget.textMsgStyle.copyWith(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _displayText, // JS data from API or status message
                      style: widget.textMsgStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // Refresh Button
            Expanded(
              flex: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: widget.textMsgStyle,
                ),
                onPressed: () {
                  setState(() {
                    _displayText = "Reloading...";
                  });
                  _webviewController.loadRequest(Uri.parse(_api_url));
                },
                child: const Text(
                  "Refresh",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

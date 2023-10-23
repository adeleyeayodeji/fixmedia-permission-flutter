package com.biggidroid.fixmediapermission.fixmedia_permission

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FixmediaPermissionPlugin */
class FixmediaPermissionPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "fixmedia_permission")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    //use switch
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
        break;
      case "requestPermission":
        requestPermission()
        result.success("Android permission granted")
        break;
      default:
        result.notImplemented()
    }
  }

  //Get android media or storage permission
  private fun requestPermission() {
    // Request the permission
    requestPermissionLauncher.launch(
        arrayOf(
            READ_EXTERNAL_STORAGE,
            READ_MEDIA_IMAGES,
            READ_MEDIA_VIDEO,
            POST_NOTIFICATIONS
        )
    )
}

//Check permission
fun checkPermission(){
    // Check if the user has enabled the permission for media storage
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
        var PERMISSION_GRANTED = PackageManager.PERMISSION_GRANTED
        // Check if the user has granted the READ_EXTERNAL_STORAGE permission
        if (checkSelfPermission(READ_EXTERNAL_STORAGE) == PERMISSION_GRANTED || checkSelfPermission(
                READ_MEDIA_IMAGES
            ) == PERMISSION_GRANTED || checkSelfPermission(
                READ_MEDIA_VIDEO
            ) == PERMISSION_GRANTED || checkSelfPermission(
                POST_NOTIFICATIONS
            ) == PERMISSION_GRANTED) {
            // Permission is granted
        } else {
            Log.d("TAG_DATA", "Not granted")
            // Permission is not granted
            // Request the permission
            requestPermission()
        }
    }
}

//requestPermissionLauncher
private val requestPermissionLauncher =
    registerForActivityResult(ActivityResultContracts.RequestMultiplePermissions()) { permissions ->
        // Check if the permission is granted or not
        if (permissions[READ_EXTERNAL_STORAGE] == true &&
            permissions[READ_MEDIA_IMAGES] == true &&
            permissions[READ_MEDIA_VIDEO] == true &&
            permissions[POST_NOTIFICATIONS] == true
        ) {
            // Permission is granted
            Log.d("TAG_DATA", "Permission granted from kotlin")
        } else {
            // Permission is not granted
            Log.d("TAG_DATA", "Permission not granted")

        }
    }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

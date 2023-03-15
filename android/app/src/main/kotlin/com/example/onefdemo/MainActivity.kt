package com.example.onefdemo


import android.content.*
import android.net.Uri
import android.net.Uri.*
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.net.URLEncoder


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "1fin/share"
        ).setMethodCallHandler { call, result ->
            var text: String?  = call.argument("text")
            if (call.method == "tweet") {
                val shareIntent = Intent()
                shareIntent.action = Intent.ACTION_SEND
                shareIntent.type = "text/plain"
                shareIntent.putExtra(Intent.EXTRA_TEXT, text)
                shareIntent.setPackage("com.twitter.android")
                val tweet = Intent(Intent.ACTION_VIEW)
                startActivity(shareIntent)
            } else if (call.method == "linkedin") {
                val shareIntent = Intent()
                shareIntent.action = Intent.ACTION_SEND
                shareIntent.type = "text/plain"
                shareIntent.putExtra(Intent.EXTRA_TEXT, text)
                shareIntent.setPackage("com.linkedin.android")
                startActivity(shareIntent)
            } else if (call.method == "whatsapp") {
                val shareIntent = Intent()
                shareIntent.action = Intent.ACTION_SEND
                shareIntent.type = "text/plain"
                shareIntent.putExtra(Intent.EXTRA_TEXT,text)
                shareIntent.setPackage("com.whatsapp")
                startActivity(shareIntent)
            }
    }
    }
}
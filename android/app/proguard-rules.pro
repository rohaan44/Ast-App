# ============================================================
#  ProGuard / R8 Rules — ast_official Flutter App
# ============================================================

# ─── Flutter Core ───────────────────────────────────────────
-keep class io.flutter.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**

# ─── Flutter Plugins General ────────────────────────────────
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.plugins.**

# ─── Kotlin ─────────────────────────────────────────────────
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings { <fields>; }
-keepclassmembers class kotlin.Lazy { *; }

# ─── Firebase Core ──────────────────────────────────────────
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

# ─── Firebase Messaging (FCM) ───────────────────────────────
-keep class com.google.firebase.messaging.** { *; }

# ─── Firebase Auth ──────────────────────────────────────────
-keep class com.google.firebase.auth.** { *; }

# ─── Google Sign-In ─────────────────────────────────────────
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }
-keep class com.google.android.gms.tasks.** { *; }

# ─── Dio / OkHttp / Retrofit (networking) ───────────────────
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-keep class okio.** { *; }

# ─── Flutter Secure Storage ─────────────────────────────────
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# ─── Flutter Local Notifications ────────────────────────────
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# ─── Hive ───────────────────────────────────────────────────
-keep class com.hivedb.** { *; }

# ─── Pusher ─────────────────────────────────────────────────
-keep class com.pusher.** { *; }
-keep class com.github.pusher.** { *; }
-dontwarn com.pusher.**

# ─── File Picker ────────────────────────────────────────────
-keep class com.mr.flutter.plugin.filepicker.** { *; }

# ─── Record / Audio ─────────────────────────────────────────
-keep class com.llfbandit.record.** { *; }
-keep class xyz.luan.audioplayers.** { *; }

# ─── Connectivity Plus ──────────────────────────────────────
-keep class dev.fluttercommunity.plus.connectivity.** { *; }

# ─── App Settings ───────────────────────────────────────────
-keep class com.baumert.flutterAppSettings.** { *; }

# ─── JSON Serialization (Gson / Moshi fallback) ─────────────
# Keep any class with fromJson / toJson methods (used by our models)
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keep class * {
    public <init>(org.json.JSONObject);
}

# ─── Enums ──────────────────────────────────────────────────
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ─── Parcelable (Android) ───────────────────────────────────
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator CREATOR;
}

# ─── Serializable ───────────────────────────────────────────
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ─── Suppress common warnings ───────────────────────────────
-dontwarn javax.annotation.**
-dontwarn sun.misc.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**
-dontwarn java.lang.invoke.**

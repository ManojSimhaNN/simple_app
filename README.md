Overview
The Fruit Store App is a Flutter application that displays a list of fruits and their descriptions. Users can navigate to a detail screen to view more information about each fruit. On the detail screen, users can capture images using their device's camera. Since an Android emulator is not available, we are using the file_picker package for capturing images on the web.

Features
Display a list of fruits with titles and descriptions.

Navigate to a detail screen for more information about each fruit.

Capture and display images on the detail screen using the device's camera (web implementation using file_picker).

Dependencies
flutter

image_picker (for mobile platforms)

file_picker (for web platform)

Getting Started
Prerequisites
Flutter SDK installed

Suitable IDE (e.g., Visual Studio Code, Android Studio)

A physical device or web browser for testing

Setup
Clone the repository:

sh
git clone https://github.com/ManojSimhaNN/simple_app.git
cd fruit-store-app
Install dependencies:

sh
flutter pub get
Android and iOS Permissions:

Android: Add the following permissions to AndroidManifest.xml:

xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
Add the following provider inside the <application> tag:

xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/file_paths" />
</provider>
Create a file_paths.xml file in res/xml/ directory with the following content:

xml
<paths>
    <external-files-path name="my_images" path="Pictures" />
</paths>
iOS: Add the following keys to Info.plist:

xml
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take pictures.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to save pictures.</string>
Running the App:

For Mobile: Run the app on a physical device:

sh
flutter run
For Web: Run the app in a web browser:

sh
flutter run -d chrome
Usage
Home Screen:

Displays a list of fruits with their titles.

Tap on a fruit to navigate to the detail screen.

Detail Screen:

Displays the title and description of the selected fruit.

Tap the "Camera" button to capture an image using the device's camera (web implementation using file_picker).

The captured image is displayed on the detail screen.

Code Structure
main.dart: Entry point of the application.

welcome.dart: Welcome scrren which navigates to HomeScreen.

home_screen.dart: Displays the list of fruits.

detail_screen.dart: Displays the detail of a selected fruit and allows capturing images.

Notes
The app uses the file_picker package for capturing images on the web platform due to the unavailability of an Android emulator.

License
This project is licensed under the MIT License - see the LICENSE file for details.


# 📦 How to Package a Flutter Linux Desktop App as a .deb File

This guide walks you through creating a `.deb` installer for your Flutter-based Linux desktop app (built for Raspberry Pi).

---

## ✅ 1. Build the App

First, ensure you have built your Linux desktop app:

```bash
flutter build linux
```

This creates your app in:

```
build/linux/arm64/release/bundle/
```

---

## ✅ 2. Create the Debian Folder Structure

```bash
mkdir -p flutterembedded_1.0.0_arm64/usr/local/bin
mkdir -p flutterembedded_1.0.0_arm64/usr/share/applications
mkdir -p flutterembedded_1.0.0_arm64/DEBIAN
```

---

## ✅ 3. Copy Your App to the Install Location

```bash
cp -r build/linux/arm64/release/bundle flutterembedded_1.0.0_arm64/usr/local/bin/flutterembedded
```

---

## ✅ 4. Create the `control` File

Create and edit:

```bash
nano flutterembedded_1.0.0_arm64/DEBIAN/control
```

Paste:

```
Package: flutterembedded
Version: 1.0.0
Section: base
Priority: optional
Architecture: arm64
Depends: libgtk-3-0
Maintainer: Your Name <you@example.com>
Description: Flutter-based embedded UI demo app for Raspberry Pi
```

---

## ✅ 5. Create the Desktop Launcher (Optional)

```bash
nano flutterembedded_1.0.0_arm64/usr/share/applications/flutterembedded.desktop
```

Paste:

```
[Desktop Entry]
Name=Flutter Embedded
Exec=/usr/local/bin/flutterembedded/flutterembedded
Icon=
Terminal=false
Type=Application
Categories=Utility;
```

---

## ✅ 6. Build the `.deb` Package

```bash
dpkg-deb --build flutterembedded_1.0.0_arm64
```

Result:

```
flutterembedded_1.0.0_arm64.deb
```

---

## ✅ 7. Install the Package on Another Pi

```bash
sudo dpkg -i flutterembedded_1.0.0_arm64.deb
```

---

## 🧠 Notes

- You can set up a systemd service to launch the app at boot.
- You can add an app icon and polish the desktop launcher.

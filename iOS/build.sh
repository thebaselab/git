#!/bin/sh

make clean
rm -rf iOS/out

PLATFORM=iPhoneOS
ARCH=arm64

XCODE_ROOT=`xcode-select -print-path`
PLATFORM_PATH=$XCODE_ROOT/Platforms/$PLATFORM.platform/Developer
SDK_PATH=$PLATFORM_PATH/SDKs/$PLATFORM.sdk
FLAGS="-isysroot $SDK_PATH -arch $ARCH -miphoneos-version-min=14.0"

CFLAGS="$FLAGS -std=gnu99"
LDFLAGS="$FLAGS -dynamiclib -framework ios_system -F$PWD/ios_system.xcframework/ios-arm64"
# CURL_LDFLAGS="$FLAGS -dynamiclib -framework ios_system -F$PWD/ios_system.xcframework/ios-arm64"
export CFLAGS LDFLAGS #CURL_LDFLAGS

sh configure \
--build=aarch64-apple-darwin \
--host=aarch64-macos-ios \
--target=aarch64-macos-ios \
--without-iconv \
--with-openssl=iOS/Frameworks_iphoneos \
--with-curl=iOS/Frameworks_iphoneos

make

# Generate frameworks
cp git iOS/git
# cp git-remote-https iOS/git-remote-https
cd iOS
mkdir out
mkdir out/git.framework
mv git out/git.framework/git
cp Info.plist out/git.framework/Info.plist
cd out
xcodebuild -create-xcframework -framework git.framework -output git.xcframework
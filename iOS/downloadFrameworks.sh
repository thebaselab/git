curl -OL https://github.com/holzschu/ios_system/releases/download/v2.9.0/ios_error.h
curl -OL https://github.com/holzschu/ios_system/releases/download/v2.9.0/ios_system.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/openssl.xcframework.zip
curl -OL https://github.com/holzschu/ios_system/releases/download/v2.9.0/curl_ios.xcframework.zip

rm -rf openssl.xcframework
rm -rf ios_system.xcframework
rm -rf curl_ios.xcframework

unzip -q openssl.xcframework.zip
unzip -q ios_system.xcframework.zip
unzip -q curl_ios.xcframework.zip

mkdir -p iOS/Frameworks_iphoneos
mkdir -p iOS/Frameworks_iphoneos/include
mkdir -p iOS/Frameworks_iphoneos/lib

cp -r openssl.xcframework/ios-arm64/Headers iOS/Frameworks_iphoneos/include/openssl/
cp -r curl_ios.xcframework/ios-arm64/curl_ios.framework/Headers iOS/Frameworks_iphoneos/include/curl/
cp -r curl_ios.xcframework/ios-arm64/curl_ios.framework/curl_ios iOS/Frameworks_iphoneos/lib/curl
cp openssl.xcframework/ios-arm64/libssl.a iOS/Frameworks_iphoneos/lib/
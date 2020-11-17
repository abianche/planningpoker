#!/bin/zsh
echo "Clean Started..."
(killall Xcode || true)
xcrun -k
flutter clean
flutter pub upgrade
flutter pub get
flutter pub cache repair
rm -rf $FLUTTER_ROOT/.pub-cache
rm -rf $HOME/Library/Caches/CocoaPods
rm -rf ios/Pods
rm -rf ios/build
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang.$(whoami)/ModuleCache"
rm -rf ~/Library/Developer/Xcode/DerivedData/
rm -rf ~/Library/Caches/com.apple.dt.Xcode/
echo "Clean Complete!"
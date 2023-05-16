#!/bin/sh

export npm_config_wcjs_runtime="electron"
export npm_config_wcjs_runtime_version="24.1.2"
export npm_config_wcjs_arch="arm64"

npm install

status=$?

if [[ $status -eq 0 ]]
then
  echo "Fixing lib"
  install_name_tool -change @rpath/libvlc.dylib /Applications/VLC.app/Contents/MacOS/lib/libvlc.dylib build/Release/WebChimera.js.node
  echo "Done fixing"
  echo "Removing old wcjs-prebuilt"
  rm ../../newapp/src/main/lib/wcjs-prebuilt/lib/WebChimera.js.node
  echo "Copying new wcjs-prebuilt"
  cp build/Release/WebChimera.js.node ../../newapp/src/main/lib/wcjs-prebuilt/lib/WebChimera.js.node
fi


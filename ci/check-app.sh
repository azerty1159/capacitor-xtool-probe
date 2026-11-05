#!/bin/sh
# T2: inspeciona o .app gerado pelo xtool. Uso: sh ci/check-app.sh xtool/CapProbe.app
APP="$1"
fail=0
t() { if eval "$2"; then echo "OK    $1"; else echo "FALHA $1"; fail=1; fi; }

echo "== conteudo de $APP"
find "$APP" -maxdepth 2 | sort
echo "== Info.plist"
cat "$APP/Info.plist"
echo "== checagens"
t "Frameworks/Capacitor.framework" '[ -d "$APP/Frameworks/Capacitor.framework" ]'
t "Frameworks/Cordova.framework"   '[ -d "$APP/Frameworks/Cordova.framework" ]'
t "public/index.html na raiz"      '[ -f "$APP/public/index.html" ]'
t "capacitor.config.json na raiz"  '[ -f "$APP/capacitor.config.json" ]'
t "MinimumOSVersion 17.2"          'grep -A1 "<key>MinimumOSVersion</key>" "$APP/Info.plist" | grep -q "<string>17.2</string>"'
t "UIApplicationSceneManifest"     'grep -q "<key>UIApplicationSceneManifest</key>" "$APP/Info.plist"'
t "FilesystemPlugin no binario"    'grep -aq FilesystemPlugin "$APP/CapProbe"'
t "SharePlugin no binario"         'grep -aq SharePlugin "$APP/CapProbe"'
exit $fail

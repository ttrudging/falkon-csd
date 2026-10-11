#!/usr/bin/env bash
set -euo pipefail
prefix="$HOME/.local/falkon-csd"
test -x "$prefix/bin/falkon" || { echo "No Falkon CSD executable: $prefix/bin/falkon"; exit 1; }
mkdir -p "$HOME/.local/bin" "$HOME/.local/share/applications"
cat > "$HOME/.local/bin/falkon-csd" <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail
exec env FALKON_CSD=1 "$HOME/.local/falkon-csd/bin/falkon" --profile "$HOME/.config/falkon-csd-test" "$@"
SCRIPT
chmod +x "$HOME/.local/bin/falkon-csd"
cat > "$HOME/.local/share/applications/falkon-csd.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Falkon CSD
Comment=Falkon with integrated client-side tab titlebar
Exec=$HOME/.local/bin/falkon-csd %u
Icon=falkon
Terminal=false
Categories=Network;WebBrowser;
StartupNotify=true
DESKTOP
echo "Launcher created: ~/.local/share/applications/falkon-csd.desktop"
echo "Command: ~/.local/bin/falkon-csd"

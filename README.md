# Falkon CSD — KDE Wayland integrated tabs

Downstream patch for **Falkon 25.04.1** that integrates the existing tab bar into
a native Qt client-side titlebar, similar to Firefox/Chrome.

Developed and tested on Debian 13 / KDE Plasma Wayland, Qt 6.8.2.

## Features (v1.4)
- Opt in using `FALKON_CSD=1` (normal decorated mode remains default)
- Tab strip and Qt minimize/maximize/close controls in one header
- Native Wayland window dragging from free tab-strip space
- Double-click empty tab-strip space to maximize/restore
- Native `QWindow::startSystemResize()` edge/corner grips, with proper resize cursors
- Existing Falkon tab switching, rearranging and detach behavior retained

**Known limitation:** KDE Breeze window shadows/rounded compositor decorations are
not yet implemented. The source is a downstream proof of concept, not an upstream release.

## Files

- `patches/falkon-csd-v1.4.patch` — cumulative patch relative to the unmodified
  Debian Falkon 25.04.1 source.
- `install-launcher.sh` — install a separate desktop launcher for the already
  built Falkon CSD binary (does not replace system Falkon).

## Build from Debian source

Make sure `deb-src` is enabled for Debian 13 and install the build dependencies.
Run:

```bash
sudo apt build-dep falkon
mkdir -p ~/Documents/falkon-csd-build
cd ~/Documents/falkon-csd-build
apt source falkon=25.04.1-1
cd falkon-25.04.1
git apply --check /path/to/falkon-csd/patches/falkon-csd-v1.4.patch
git apply /path/to/falkon-csd/patches/falkon-csd-v1.4.patch
cmake -S . -B build-csd -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$HOME/.local/falkon-csd"
cmake --build build-csd -j4
cmake --install build-csd
```

Debian may strip vendored JS resources from its source tarball. If CMake reports
missing `src/lib/data/html/jquery.js` / `jquery-ui.js`, install
`libjs-jquery` / `libjs-jquery-ui` and link those files from
`/usr/share/javascript/`.

Run with an independent profile:

```bash
FALKON_CSD=1 ~/.local/falkon-csd/bin/falkon --profile ~/.config/falkon-csd-test
```

**Do not overwrite the Debian `falkon` package while the patch is experimental.**

## License

Falkon code remains subject to upstream GPL license and source copyright
notices; this patch does not supersede upstream licensing.

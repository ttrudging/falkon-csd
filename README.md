# Falkon CSD

KDE Falkon with Firefox/Chrome-style integrated tabs.

## Tested release

- Falkon 26.08.2
- Debian 13 / KDE Plasma Wayland
- Qt 6.8.2
- Native client-side decorations
- Integrated tab strip and window buttons
- Native Wayland window dragging
- Double-click maximize/restore
- Edge and corner resizing with cursors

## Build

Apply patches/falkon-csd-26.08.2.patch to the
matching upstream Falkon 26.08.2 source.

Build with CMake and enable using FALKON_CSD=1.

## Known limitation

KDE Breeze shadows and rounded corners remain unfinished.

## License

Upstream Falkon licensing and copyright notices apply.

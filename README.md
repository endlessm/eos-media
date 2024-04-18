eos-media
=========

default media for EOS

Updating the default wallpaper
------------------------------

As of Endless OS 6, we provide a dark variant of the default wallpaper

1. Add the new wallpapers to `default_files/default_images/`
2. Update the paths to those wallpapers in `default_files/meson.build`
3. Add licensing information to `default_files/default_images/LICENSE.tsv`

Since the wallpapers are renamed during the build process, the default wallpaper XML does not need to be updated.

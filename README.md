eos-media
=========

default media for EOS

Updating the default wallpaper
------------------------------

As of Endless OS 6, we provide a dark variant of the default wallpaper

1. Add the new wallpapers to `default_files/default_images/`
2. Update the paths to those wallpapers in `default_files/meson.build`
3. Add licensing information to `default_files/default_images/LICENSE.tsv`

Since the default wallpapers are also installed with a standardized default file name during the build process, the dynamic wallpaper XML does not need to be updated.

Testing locally
---------------

To test changes to these packages on Endless OS:

1. Ensure you have an up-to-date [Endless OS toolbx container](https://support.endlessos.org/en/dev/eos-containers)

2. Clone this repository and enter its directory, e.g.

   ```sh
   git clone git@github.com:endlessm/eos-media.git
   cd eos-media
   ```

3. Enter the container, e.g.

   ```sh
   toolbox enter eos-toolbox-latest
   ```

5. Install build dependencies in the container, e.g.

   ```sh
   sudo apt build-dep .
   ```

6. Build the debian packages

   ```sh
   dpkg-buildpackage -uc -us -b
   ```

7. Exit the container with `exit` to return to the host

8. Temporarily unlock your filesystem so you can install packages

   ```sh
   sudo eos-dev-unlock
   ```

9. Install the built packages on the host, e.g.

   ```sh
   sudo dpkg --install ../eos-default-background_*.deb ../eos-media_*.deb
   ```

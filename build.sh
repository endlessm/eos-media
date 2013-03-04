#!/bin/bash -e

# Install dependencies
sudo apt-get install -y devscripts debhelper

pushd `dirname $0`
  # Clean up old artifacts
   set +e
		rm -rf *.deb
		rm -rf *.changes
   set -e

	pushd ../eos-build &> /dev/null
      INSTALL_DIR=$(pwd)
		export GNUPGHOME=${INSTALL_DIR}/gnupg
	popd &> /dev/null

  # Build package
  debuild -k4EB55A92 -b
  
  # Move package to this directory and clean up
   mv ../endlessos-base-media*.deb .
   mv ../endlessos-base-media*.changes .
   rm -f ../*.build
popd

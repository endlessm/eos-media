endlessos-backgrounds.xml: Makefile
	$(AM_V_GEN) bgfiles=`for file in \`find $(top_srcdir)/default_files/default_images -name "*.jpg"\`; do echo $$file; done | sort`; \
	( echo "<?xml version=\"1.0\"?>"; \
	  echo "<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">"; \
	  echo "<wallpapers>" ) > $@ ; \
	for file in $$bgfiles; do \
	  filename=`basename $$file`; \
	  ( echo "  <wallpaper deleted=\"false\">"; \
	    echo "    <name>Background $$filename</name>"; \
	    echo "    <filename>$(datadir)/eos-media/default_images/$$filename</filename>"; \
	    echo "    <options>zoom</options>"; \
	    echo "    <shade_type>solid</shade_type>"; \
	    echo "    <pcolor>#3465a4</pcolor>"; \
	    echo "    <scolor>#000000</scolor>"; \
	    echo "  </wallpaper>" ) >> $@ ; \
	done; \
	echo "</wallpapers>" >> $@;

backgroundsdir = $(datadir)/gnome-background-properties
backgrounds_DATA = endlessos-backgrounds.xml

CLEANFILES = $(backgrounds_DATA)

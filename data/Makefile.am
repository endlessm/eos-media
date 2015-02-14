personalities = Arabic Brazil Global Guatemala Haiti Spanish

all-local:
	for personality in $(personalities); do \
	  perskey=`echo "$$personality" | tr "[:upper:]" "[:lower:]"`; \
	  persfiles=`for file in \`find $(top_srcdir)/default_files/default_images -name "*.jpg"\`; do echo $$file; done | sort`; \
	  xmlfile="endlessos-backgrounds-$$personality.xml"; \
	  ( echo "<?xml version=\"1.0\"?>"; \
	    echo "<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">"; \
	    echo "<wallpapers>" ) > $$xmlfile ; \
	  for file in $$persfiles; do \
	    filename=`basename $$file`; \
	    ( echo "  <wallpaper deleted=\"false\">"; \
	      echo "    <name>Background $$filename</name>"; \
	      echo "    <filename>$(datadir)/eos-media/default_images/$$filename</filename>"; \
	      echo "    <options>zoom</options>"; \
	      echo "    <shade_type>solid</shade_type>"; \
	      echo "    <pcolor>#3465a4</pcolor>"; \
	      echo "    <scolor>#000000</scolor>"; \
	      echo "  </wallpaper>" ) >> $$xmlfile ; \
	  done; \
	  echo "</wallpapers>" >> $$xmlfile; \
	done

backgroundsdir = $(datadir)/gnome-background-properties
backgrounds_DATA = $(wildcard endlessos-backgrounds-*.xml)

CLEANFILES = $(backgrounds_DATA)

endlessos-backgrounds.xml: Makefile generate-xml
	$(AM_V_GEN) $(srcdir)/generate-xml --datadir $(datadir) $(top_srcdir)/default_files/default_images > $@

backgroundsdir = $(datadir)/gnome-background-properties
backgrounds_DATA = endlessos-backgrounds.xml

CLEANFILES = $(backgrounds_DATA)
EXTRA_DIST = generate-xml

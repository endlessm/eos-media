media_directories = default_images default_music

do_subst = sed -e 's|@DATA_DIR[@]|$(datadir)|g'

eos-link-user-dirs: eos-link-user-dirs.in Makefile
	$(AM_V_GEN) $(do_subst) $< > $@
	chmod +x $@

# We distribute all the media files inside .tar archives
# because some of the files contain spaces
# (and thus cannot be directly listed as EXTRA_DIST).
# (The media files are already compressed,
# so no need to compress the archive.)
# Note that this is just for the build system;
# the built package manages the files individually.
images_archive = default_files/default_images/images.tar
music_archive = default_files/default_music/music.tar
$(images_archive):
	$(AM_V_GEN)$(MKDIR_P) $(dir $(images_archive)) && \
	tar -cf $(images_archive) -C $(srcdir)/default_files/default_images .
$(music_archive):
	$(AM_V_GEN)$(MKDIR_P) $(dir $(music_archive)) && \
	tar -cf $(music_archive) -C $(srcdir)/default_files/default_music .

# Rule to unzip the media archives during install
install-data-hook:
	$(mkdir_p) $(DESTDIR)$(datadir)/eos-media/default_images
	cd $(DESTDIR)$(datadir)/eos-media/default_images && \
	tar --no-same-owner -xvf $(abs_srcdir)/$(images_archive)
	$(mkdir_p) $(DESTDIR)$(datadir)/eos-media/default_music
	cd $(DESTDIR)$(datadir)/eos-media/default_music && \
	tar --no-same-owner -xvf $(abs_srcdir)/$(music_archive)

# Rule to uninstall the unzipped files
uninstall-local:
	for directory in $(media_directories); do \
		rm -rf $(DESTDIR)$(datadir)/eos-media/$$directory; \
	done

dist_noinst_DATA = \
	$(images_archive) \
	$(music_archive) \
	$(NULL)

bin_SCRIPTS = eos-link-user-dirs

EXTRA_DIST = eos-link-user-dirs.in
CLEANFILES = eos-link-user-dirs

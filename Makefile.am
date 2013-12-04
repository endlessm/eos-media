SUBDIRS = data

do_subst = sed -e 's|@DATA_DIR[@]|$(datadir)|g'

eos-link-user-dirs: eos-link-user-dirs.in Makefile
	$(AM_V_GEN) $(do_subst) $< > $@
	chmod +x $@

# During dist, we create archives to distribute all the media
# files because some of them contain spaces
# (and thus cannot be directly listed as EXTRA_DIST).
# dist-hook will unpack the archives again and remove them
# from the final tarball

images_dir = default_files/default_images
images_archive = $(images_dir)/images.tar
do_create_images_archive = $(AM_V_GEN)$(mkdir_p) $(images_dir) && \
	tar -pcf $(images_archive) -C $(srcdir)/$(images_dir) .

music_dir = default_files/default_music
music_archive = $(music_dir)/music.tar
do_create_music_archive = $(AM_V_GEN)$(mkdir_p) $(music_dir) && \
	tar -pcf $(music_archive) -C $(srcdir)/$(music_dir) .

videos_dir = default_files/default_videos
videos_archive = $(videos_dir)/videos.tar
do_create_videos_archive = $(AM_V_GEN)$(mkdir_p) $(videos_dir) && \
	tar -pcf $(videos_archive) -C $(srcdir)/$(videos_dir) .

all_archives = \
	$(images_archive) \
	$(music_archive) \
	$(videos_archive) \
	$(NULL)

$(images_archive):
	$(do_create_images_archive)
$(music_archive):
	$(do_create_music_archive)
$(videos_archive):
	$(do_create_videos_archive)

dist-hook:
	tar --no-same-owner -xvf $(distdir)/$(images_archive) -C $(distdir)/$(images_dir)
	chmod +w $(distdir)/$(images_dir)
	rm -f $(distdir)/$(images_archive)
	tar --no-same-owner -xvf $(distdir)/$(music_archive) -C $(distdir)/$(music_dir)
	chmod +w $(distdir)/$(music_dir)
	rm -f $(distdir)/$(music_archive)
	tar --no-same-owner -xvf $(distdir)/$(videos_archive) -C $(distdir)/$(videos_dir)
	chmod +w $(distdir)/$(videos_dir)
	rm -f $(distdir)/$(videos_archive)

images_destdir = $(DESTDIR)$(datadir)/eos-media/default_images
music_destdir = $(DESTDIR)$(datadir)/eos-media/default_music
videos_destdir = $(DESTDIR)$(datadir)/eos-media/default_videos

# Now while installing we also have to create the same
# archive, and immediately untar it into the target directory
install-data-hook:
	$(do_create_images_archive)
	$(mkdir_p) $(images_destdir)
	tar --no-same-owner -xvf $(abs_builddir)/$(images_archive) -C $(images_destdir)
	chmod +w $(images_destdir)
	rm -f $(abs_builddir)/$(images_archive)
	$(do_create_music_archive)
	$(mkdir_p) $(music_destdir)
	tar --no-same-owner -xvf $(abs_builddir)/$(music_archive) -C $(music_destdir)
	chmod +w $(music_destdir)
	rm -f $(abs_builddir)/$(music_archive)
	$(do_create_videos_archive)
	$(mkdir_p) $(videos_destdir)
	tar --no-same-owner -xvf $(abs_builddir)/$(videos_archive) -C $(videos_destdir)
	chmod +w $(videos_destdir)
	rm -f $(abs_builddir)/$(videos_archive)

# Remove all we installed above 
uninstall-local:
	rm -rf $(images_destdir)
	rm -rf $(music_destdir)
	rm -rf $(videos_destdir)

getting_starteddir = $(datadir)/EndlessOS/getting-started/C
getting_started_DATA = getting-started/C/endless-getting-started.mov

getting_started_esdir = $(datadir)/EndlessOS/getting-started/es
getting_started_es_DATA = getting-started/es/endless-getting-started.mov

getting_started_ptdir = $(datadir)/EndlessOS/getting-started/pt
getting_started_pt_DATA = getting-started/pt/endless-getting-started.mov

bin_SCRIPTS = eos-link-user-dirs

EXTRA_DIST = \
	eos-link-user-dirs.in \
	$(getting_started_DATA) \
	$(getting_started_es_DATA) \
	$(getting_started_pt_DATA) \
	$(all_archives) \
	$(NULL)

CLEANFILES = \
	eos-link-user-dirs \
	$(all_archives) \
	$(NULL)

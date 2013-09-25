media_directories = default_images default_music

do_subst = sed -e 's|@DATA_DIR[@]|$(datadir)|g'

eos-link-user-dirs: eos-link-user-dirs.in Makefile
	$(AM_V_GEN) $(do_subst) $< > $@
	chmod +x $@

install-data-local:
	for directory in $(media_directories); do \
		$(mkdir_p) $(DESTDIR)$(datadir)/eos-media; \
		cp -a $(srcdir)/default_files/$$directory $(DESTDIR)$(datadir)/eos-media; \
	done

uninstall-local:
	for directory in $(media_directories); do \
		rm -rf $(DESTDIR)$(datadir)/eos-media/$$directory; \
	done

bin_SCRIPTS = eos-link-user-dirs

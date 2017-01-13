SUBDIRS = data

bin_SCRIPTS = eos-link-user-dirs

EXTRA_DIST = \
	eos-link-user-dirs \
	$(NULL)

CLEANFILES = \
	$(NULL)

# We want to distribute and install files that have spaces in them. Make
# doesn't support that since it treats all spaces as token separators,
# so we have to handle those files specially. We do that in two ways:
#
# 1. Manually install and uninstall the files without standard make or
#    automake variables. By building the file list through shell file
#    globbing, we avoid make and also any loss of filename boundaries
#    from reading shell stdout.
# 2. We distribute the entire source directory so that automake doesn't
#    build the dist file list and fall into the same traps with make.
#
# A secondary issue of non-ascii filenames is also worked around by #1
# since we avoid scraping stdout, which would depend on the locale of
# the shell driving the build.
images_srcdir = $(srcdir)/default_files/default_images
images_instdir = $(pkgdatadir)/default_images

# The make functions defined here are just for convenience, but they
# avoid a lot of duplicated commands below. This does mean we require
# GNU make, though. They take 2 parameters: the install directory and
# the pattern of files to install.
install_pattern = \
	echo " $(MKDIR_P) '$(DESTDIR)$(1)'"; \
	$(MKDIR_P) "$(DESTDIR)$(1)" || exit $$?; \
	for f in $(2); do \
	  echo " $(INSTALL_DATA) '$$f' '$(DESTDIR)$(1)'"; \
	  $(INSTALL_DATA) "$$f" "$(DESTDIR)$(1)" || exit $$?; \
	done
uninstall_pattern = \
	for f in $(2); do \
	  t=`echo $$f | sed -e 's|^.*/||'`; \
	  echo " rm -f '$(DESTDIR)$(1)/$$t'"; \
	  rm -f "$(DESTDIR)$(1)/$$t"; \
	done

install-data-local:
	@$(call install_pattern,$(images_instdir),$(images_srcdir)/*)
	cp $(DESTDIR)$(images_instdir)/bg_global_02.jpg $(DESTDIR)$(pkgdatadir)/desktop-background-C.jpg
	ln -fs $(images_instdir)/bg_global_01.jpg $(DESTDIR)$(pkgdatadir)/desktop-background-es_GT.jpg
	ln -fs $(images_instdir)/bg_fnde_01.jpg $(DESTDIR)$(pkgdatadir)/desktop-background-fnde.jpg
	ln -fs $(images_instdir)/bg_brazil_01.jpg $(DESTDIR)$(pkgdatadir)/desktop-background-pt_BR.jpg
	ln -fs $(images_instdir)/bg_china_03.jpg $(DESTDIR)$(pkgdatadir)/desktop-background-zh_CN.jpg

uninstall-local:
	@$(call uninstall_pattern,$(images_instdir),$(images_srcdir)/*)
	rm -f $(DESTDIR)$(pkgdatadir)/desktop-background-C.jpg
	rm -f $(DESTDIR)$(pkgdatadir)/desktop-background-es_GT.jpg
	rm -f $(DESTDIR)$(pkgdatadir)/desktop-background-fnde.jpg
	rm -f $(DESTDIR)$(pkgdatadir)/desktop-background-pt_BR.jpg
	rm -f $(DESTDIR)$(pkgdatadir)/desktop-background-zh_CN.jpg

EXTRA_DIST += \
	$(images_srcdir) \
	$(NULL)

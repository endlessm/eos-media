custom_target(
    'endlessos-backgrounds.xml',
    command: [
        files('generate-xml'),
        '--datadir',
        get_option('prefix') / datadir,
        meson.current_source_dir() / '../default_files/default_images',
    ],
    capture: true,
    output: 'endlessos-backgrounds.xml',
    install: true,
    install_dir: datadir / 'gnome-background-properties',
)

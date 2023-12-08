install_subdir(
    'default_images',
    install_dir: pkgdatadir
)

# The default background is shipped in a separate package, eos-default-background, so
# cannot be a symlink
install_data(
    'default_images/River_Surrounded_by_Mountains.jpg',
    rename: ['desktop-background-C.jpg'],
    install_dir: pkgdatadir,
)

foreach link_name, target : {
   'desktop-background-es_GT.jpg': 'bg_global_01.jpg',
   'desktop-background-fnde.jpg':  'bg_fnde_01.jpg',
   'desktop-background-pt_BR.jpg': 'bg_brazil_01.jpg',
   'desktop-background-zh_CN.jpg': 'bg_china_03.jpg',
}
    install_symlink(
        link_name,
        install_dir: pkgdatadir,
        pointing_to: 'default_images' / target,
    )
endforeach


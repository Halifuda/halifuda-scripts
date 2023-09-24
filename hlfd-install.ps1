$pkgs=@(
    "vim.vim", 
    "sharkdp.bat", 
    "7zip.7zip", 
    "bootandy.dust", 
    "BurntSushi.ripgrep.MSVC", 
    "lsd-rs.lsd", 
    "Clement.bottom")

foreach ($pkg in $pkgs) {
    echo $pkg
    winget install --id=$pkg --no-upgrade
}


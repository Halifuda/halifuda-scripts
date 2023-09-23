$pkgs=@("vim.vim", "sharkdp.bat", "7zip.7zip", "bootandy.dust", "BurntSushi.ripgrep.MSVC", "lsd-rs.lsd")

foreach ($pkg in $pkgs) {
    winget install --id=$pkg --no-upgrade
}


function prompt {
    $gitbranch = git rev-parse --abbrev-ref HEAD 2> $null
    Write-Host "PS " -NoNewLine -ForegroundColor:magenta
    Write-Host "$env:username " -NoNewLine -ForegroundColor:green
    Write-Host "$(Get-Date) " -NoNewLine -ForegroundColor:blue
    if (($gitbranch -ne "") -and ($gitbranch -ne $null))
    {
        Write-Host "(" -NoNewLine -ForegroundColor:magenta
        Write-Host $gitbranch -NoNewLine -ForegroundColor:magenta
        Write-Host ")" -NoNewLine -ForegroundColor:magenta
    }
    Write-Host " "
    Write-Host "$($executionContext.SessionState.Path.CurrentLocation)" -NoNewLine -ForegroundColor:cyan
    Write-Host " $('$' * ($nestedPromptLevel + 1))" -NoNewLine
    return " "
}

Set-Alias -Name Zip -Value Compress-Archive
Set-Alias -Name Unzip -Value Expand-Archive

function zip($path, $dest) {
    Compress-Archive -Path $path -DestinationPath $dest
}
function unzip($path, $dest) {
    Expand-Archive -Path $path -DestinationPath $dest
}

# lsd
remove-item alias:ls

function l($d) { lsd --config-file $HOME\.config\lsd.yaml -1 $d }
function ls($d) { lsd --config-file $HOME\.config\lsd.yaml $d }
function ll($d) { lsd --config-file $HOME\.config\lsd.yaml -l $d }
function la($d) { lsd --config-file $HOME\.config\lsd.yaml -a $d }
function lt($d) { lsd --config-file $HOME\.config\lsd.yaml --tree $d }
function lla($d) { lsd --config-file $HOME\.config\lsd.yaml -la $d }

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship-pastel.toml"


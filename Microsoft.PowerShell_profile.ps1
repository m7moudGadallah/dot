# Function to get the current Git branch
function Get-GitBranch {
    $branch = git rev-parse --abbrev-ref HEAD 2>$null
    if ($branch) { return " ($branch)" }  # Just return the branch name
    return ""
}

# Custom PowerShell Prompt with Colors
function prompt {
    $path = Get-Location
    $gitBranch = Get-GitBranch

    # Print each part with colors
    Write-Host "$path" -ForegroundColor Green -NoNewline
    if ($gitBranch) {
        Write-Host "$gitBranch" -ForegroundColor Yellow -NoNewline
    }
    Write-Host "`n> " -ForegroundColor Cyan -NoNewline
    return " "  # Required to avoid formatting issues
}


# Linux-like aliases for PowerShell

function ls { Get-ChildItem @args }   # Supports arguments like "ls -l"
function ll { Get-ChildItem -Force }  # Show hidden files
function la { Get-ChildItem -Force -Recurse } # Show all files recursively
function pwd { Get-Location }
function mv { Move-Item @args }
function rm { Remove-Item @args }
function cp { Copy-Item @args }
function mkdir { New-Item -ItemType Directory -Path $args[0] }
function touch { New-Item -ItemType File -Path $args[0] -Force }
function cat { Get-Content @args }
function grep { Select-String @args }
function man { Get-Help @args }
function ps { Get-Process @args }
function kill { Stop-Process -Name $args[0] -Force }
function clear { Clear-Host }

# Enable "rm -rf" functionality
function rmrf { Remove-Item -Recurse -Force -Path $args[0] }
Set-Alias "rm -rf" rmrf

# "which" command alternative
function which { Get-Command -Name $args[0] -ErrorAction SilentlyContinue }
Set-Alias which which




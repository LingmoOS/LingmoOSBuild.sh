<#
    .DESCRIPTION
    Contain helpers for using git.
#>

Import-Module "$PSScriptRoot/GlobalConfig"

<#
    .DESCRIPTION
    Remove the Dir if it exists
#>
function Remove-DirIfExist {
    param (
        [Parameter(Mandatory)]
        [string] $dirPath
    )

    # Check if dir exists
    if (Test-Path -Path $dirPath) {
        Remove-Item $dirPath -Recurse -Force
    }
}

<#
    .DESCRIPTION
    Clone repo into given directory
    .OUTPUTS
    Path to the cloned repo
#>
function Import-LingmoRepo {  
    param (
        [Parameter(Mandatory)]
        [string] $repoURL,
        [Parameter(Mandatory)]
        [string] $saveName
    )

    $cloneDst = "$(Get-SourceCodePath)/$saveName"

    Remove-DirIfExist $cloneDst

    git clone $repoURL $cloneDst

    return $cloneDst
}
Export-ModuleMember -Function Import-LingmoRepo

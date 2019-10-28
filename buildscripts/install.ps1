$ErrorActionPreference = 'Stop'

try {

    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

    $requiredModules = @('PSPostMan')
    foreach ($m in $requiredModules) {
        Write-Host "Installing [$($m)] module..."
        Install-Module -Name $m -Force
        Write-Host "Removing [$($m)] module from current session..."
        Remove-Module -Name $m -Force -ErrorAction Ignore
        Write-Host "Importing [$($m)] module into current session..."
        Import-Module -Name $m
    }

} catch {
    Write-Error -Message $_.Exception.Message
    $host.SetShouldExit($LastExitCode)
}
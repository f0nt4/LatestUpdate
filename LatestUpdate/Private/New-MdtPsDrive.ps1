Function New-MdtPsDrive {
    [CmdletBinding(SupportsShouldProcess = $True)]
    Param (
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [String]$Drive,

        [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
        [String]$Path
    )
    $Drive = "DS001"
    If ($pscmdlet.ShouldProcess("$($Drive): to $($Path)", "Mapping")) {
        If (Test-Path "$($Drive):") {
            Write-Verbose "Found existing MDT drive $Drive."
            Remove-PSDrive -Name $Drive -Force
        }
        New-PSDrive -Name $Drive -PSProvider MDTProvider -Root $Path
    }
}
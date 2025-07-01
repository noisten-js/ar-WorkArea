$cusers = @("hbruciaga", "msanchez", "tdeckys")
$user = "jassmith"

$cgroups = @()
foreach ($u in $cusers) {
    $cgroups = $cgroups + (Get-ADUser $u -Properties MemberOf).MemberOf | Get-ADGroup
}
$cgroups = $cgroups | Sort-Object | Select -Unique

$ugroups = (Get-ADUser $user -Properties MemberOf).MemberOf | Get-ADGroup | Sort-Object

$diff = Compare-Object -ReferenceObject $cgroups -DifferenceObject $ugroups -PassThru | Where-Object {$_.SideIndator -eq "<="}
Describe "ContosoEntraConfig" -Tag "Privilege", "GreyIT" {
    It "Check 'Contoso MFA Users' group" -Tag 'Severity:Low' {

        $groupId = "fb8cffe9-66a0-49d1-8e92-4ff9c3b306b0"

        try {
            $memberCount = Get-MgGroupTransitiveMemberCount -GroupId $groupId -ConsistencyLevel eventual
        }
        catch {
            Write-Error $_.Exception.Message
        }

        # Test if the group exists and has members
        $memberCount | Should -BeGreaterThan 0
    }
}
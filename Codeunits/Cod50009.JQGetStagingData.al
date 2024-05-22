/// <summary>
/// Codeunit CRX Get Staging Data (ID 50009).
/// </summary>
codeunit 50009 "CRX JQ Get Staging Data"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        AccessTokenManagementCULcl: Codeunit "CRX Access Token Management";
    begin
        AccessTokenManagementCULcl.GetPeosData();
        AccessTokenManagementCULcl.GetBrokersData();
        AccessTokenManagementCULcl.GetSalespersonData();
        AccessTokenManagementCULcl.GetGroupData(); // Peos Id,broker Id,Salesman Id
        AccessTokenManagementCULcl.GetAccountData(); // Group Id
        AccessTokenManagementCULcl.GetContactData(); // Group Id,Peos Id,Salesman Id,Peos Id
        AccessTokenManagementCULcl.GetUsagesData(); //Group Id, Peos Id
        AccessTokenManagementCULcl.GetClaimData();
    end;

}

codeunit 50010 "CRX JQ Process Staging Data"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        PeosStagingRecLcl: Record "CRX peos staging";
        BrokersStagingRecLcl: Record "CRX Brokers Staging";
        SalespersonStagingRecLcl: Record "CRX Salesperson Staging";
        GroupsStagingRecLcl: Record "CRX Groups Staging";
        AccountsStagingRecLcl: Record "CRX Accounts Staging";
        ContactStagingRecLcl: Record "CRX Contact Staging";
        ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
    begin
        PeosStagingRecLcl.Reset();
        PeosStagingRecLcl.SetRange(Processed, false);
        if PeosStagingRecLcl.FindSet() then
            ProcessStagingDataaCULcl.ProcessPeosStaging(PeosStagingRecLcl);

        BrokersStagingRecLcl.Reset();
        BrokersStagingRecLcl.SetRange(Processed, false);
        if BrokersStagingRecLcl.FindSet() then
            ProcessStagingDataaCULcl.ProcessBrokerStaging(BrokersStagingRecLcl);

        SalespersonStagingRecLcl.Reset();
        SalespersonStagingRecLcl.SetRange(Processed, false);
        if SalespersonStagingRecLcl.FindSet() then
            ProcessStagingDataaCULcl.ProcessSalespersonStaging(SalespersonStagingRecLcl);

        GroupsStagingRecLcl.Reset();
        GroupsStagingRecLcl.SetRange(Processed, false);
        if GroupsStagingRecLcl.FindSet() then
            ProcessStagingDataaCULcl.ProcessGroupsStaging(GroupsStagingRecLcl); // Peos Id,broker Id,Salesman Id

        AccountsStagingRecLcl.Reset();
        AccountsStagingRecLcl.SetRange(Processed, false);
        if AccountsStagingRecLcl.FindSet() then
            ProcessStagingDataaCULcl.ProcessAccountStaging(AccountsStagingRecLcl); // Group Id

        ContactStagingRecLcl.Reset();
        ContactStagingRecLcl.SetRange(Processed, false);
        if ContactStagingRecLcl.FindSet() then
            ProcessStagingDataaCULcl.ProcessContactStaging(ContactStagingRecLcl); // Group Id,Peos Id,Salesman Id,Peos Id        
    end;

}

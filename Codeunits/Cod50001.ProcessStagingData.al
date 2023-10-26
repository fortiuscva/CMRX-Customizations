codeunit 50001 "CRX Process Staging Data"
{
    trigger OnRun()
    begin

    end;

    procedure ProcessPeosStaging(var PeosStagingRecLcl: Record "CRX peos staging")
    var
        CustomerRecLcl: Record Customer;
        PeosStagingCU: Codeunit "CRX Peos Staging";
    begin
        PeosStagingRecLcl.SetRange(Processed, false);
        if PeosStagingRecLcl.FindSet() then begin
            repeat
                ClearLastError();
                if not PeosStagingCU.Run(PeosStagingRecLcl) then begin
                    PeosStagingRecLcl."Error Message" := GetLastErrorText();
                    PeosStagingRecLcl.Processed := false;
                end else begin
                    PeosStagingRecLcl.Processed := true;
                    PeosStagingRecLcl."Error Message" := '';
                    PeosStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                PeosStagingRecLcl.Modify();
            until PeosStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessGroupsStaging(var GroupsStagingRecLcl: Record "CRX Groups Staging")
    var
        GroupsStagingCU: Codeunit "CRX Groups Staging";
    begin
        GroupsStagingRecLcl.SetRange(Processed, false);
        if GroupsStagingRecLcl.FindSet() then begin
            repeat
                ClearLastError();
                if not GroupsStagingCU.Run(GroupsStagingRecLcl) then begin
                    GroupsStagingRecLcl."Error Message" := GetLastErrorText();
                    GroupsStagingRecLcl.Processed := false;
                end else begin
                    GroupsStagingRecLcl.Processed := true;
                    GroupsStagingRecLcl."Error Message" := '';
                    GroupsStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                GroupsStagingRecLcl.Modify();
            until GroupsStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessUsagesStaging(var UsagesStagingRecLcl: Record "CRX Usages Staging")
    var
        UsuagesStagingCU: Codeunit "CRX Usages Staging";
    begin
        UsagesStagingRecLcl.SetRange(Processed, false);
        if UsagesStagingRecLcl.FindSet() then begin
            repeat
                ClearLastError();
                if not UsuagesStagingCU.Run(UsagesStagingRecLcl) then begin
                    UsagesStagingRecLcl."Error Message" := GetLastErrorText();
                    UsagesStagingRecLcl.Processed := false;
                end else begin
                    UsagesStagingRecLcl.Processed := true;
                    UsagesStagingRecLcl."Error Message" := '';
                    UsagesStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                UsagesStagingRecLcl.Modify();
            until UsagesStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessAccountStaging(var AccountsStagingRecLcl: Record "CRX Accounts Staging")
    var
        AccountsStagingCU: Codeunit "CRX Accounts Staging";
    begin
        AccountsStagingRecLcl.SetRange(Processed, false);
        if AccountsStagingRecLcl.FindSet() then begin
            repeat
                ClearLastError();
                if not AccountsStagingCU.Run(AccountsStagingRecLcl) then begin
                    AccountsStagingRecLcl."Error Message" := GetLastErrorText();
                    AccountsStagingRecLcl.Processed := false;
                end else begin
                    AccountsStagingRecLcl.Processed := true;
                    AccountsStagingRecLcl."Error Message" := '';
                    AccountsStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                AccountsStagingRecLcl.Modify();
            until AccountsStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessBrokerStaging(var BrokersStagingRecLcl: Record "CRX Brokers Staging")
    var
        BrokersStagingCU: Codeunit "CRX BrokerStaging";
    begin
        BrokersStagingRecLcl.SetRange(Processed, false);
        if BrokersStagingRecLcl.FindSet() then begin
            repeat
                ClearLastError();
                if not BrokersStagingCU.Run(BrokersStagingRecLcl) then begin
                    BrokersStagingRecLcl."Error Message" := GetLastErrorText();
                    BrokersStagingRecLcl.Processed := false;
                end else begin
                    BrokersStagingRecLcl.Processed := true;
                    BrokersStagingRecLcl."Error Message" := '';
                    BrokersStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                BrokersStagingRecLcl.Modify();
            until BrokersStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessSalemenStaging(var SalesmenStagingRecLcl: Record "CRX Salesmen Staging")
    var
        SalesmenStagingCU: Codeunit "CRX SalesmenStaging";
    begin
        SalesmenStagingRecLcl.SetRange(Processed, false);
        if SalesmenStagingRecLcl.FindSet() then begin
            repeat
                ClearLastError();
                if not SalesmenStagingCU.Run(SalesmenStagingRecLcl) then begin
                    SalesmenStagingRecLcl."Error Message" := GetLastErrorText();
                    SalesmenStagingRecLcl.Processed := false;
                end else begin
                    SalesmenStagingRecLcl.Processed := true;
                    SalesmenStagingRecLcl."Error Message" := '';
                    SalesmenStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                SalesmenStagingRecLcl.Modify();
            until SalesmenStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;
}
codeunit 50001 "CRX Process Staging Data"
{
    trigger OnRun()
    begin

    end;

    procedure ProcessPeosStaging(var PeosStagingRecPar: Record "CRX peos staging")
    var
        PeosStagingCU: Codeunit "CRX Peos Staging";
        PeosStagingRecLcl: Record "CRX peos staging";
    begin
        PeosStagingRecLcl.Copy(PeosStagingRecPar);
        PeosStagingRecLcl.SetRange(Processed, false);
        if PeosStagingRecLcl.FindSet() then
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
                Commit();
            until PeosStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;

    procedure ProcessGroupsStaging(var GroupsStagingRecPar: Record "CRX Groups Staging")
    var
        GroupsStagingCU: Codeunit "CRX Groups Staging";
        GroupsStagingRecLcl: Record "CRX Groups Staging";
    begin
        GroupsStagingRecLcl.Copy(GroupsStagingRecPar);
        GroupsStagingRecLcl.SetRange(Processed, false);
        if GroupsStagingRecLcl.FindSet() then
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
                Commit();
            until GroupsStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;

    procedure ProcessUsagesStaging(var UsagesStagingRecPar: Record "CRX Usages Staging")
    var
        UsuagesStagingCU: Codeunit "CRX Usages Staging";
        UsagesStagingRecLcl: Record "CRX Usages Staging";
    begin
        UsagesStagingRecLcl.Copy(UsagesStagingRecPar);
        UsagesStagingRecLcl.SetRange(Processed, false);
        if UsagesStagingRecLcl.FindSet() then
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
                Commit();
            until UsagesStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;

    procedure ProcessAccountStaging(var AccountsStagingRecPar: Record "CRX Accounts Staging")
    var
        AccountsStagingCU: Codeunit "CRX Accounts Staging";
        AccountsStagingRecLcl: Record "CRX Accounts Staging";
    begin
        AccountsStagingRecLcl.Copy(AccountsStagingRecPar);
        AccountsStagingRecLcl.SetRange(Processed, false);
        if AccountsStagingRecLcl.FindSet() then
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
                Commit();
            until AccountsStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;

    procedure ProcessBrokerStaging(var BrokersStagingRecPar: Record "CRX Brokers Staging")
    var
        BrokersStagingCU: Codeunit "CRX Broker Staging";
        BrokersStagingRecLcl: Record "CRX Brokers Staging";
    begin
        BrokersStagingRecLcl.Copy(BrokersStagingRecPar);
        BrokersStagingRecLcl.SetRange(Processed, false);
        if BrokersStagingRecLcl.FindSet() then
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
                Commit();
            until BrokersStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;

    procedure ProcessSalespersonStaging(Var SalespersonStagingRecPar: Record "CRX Salesperson Staging")
    var
        SalespersonStagingCU: Codeunit "CRX Salesperson Staging";
        SalespersonStagingRecLcl: Record "CRX Salesperson Staging";
    begin
        SalespersonStagingRecLcl.Copy(SalespersonStagingRecPar);
        SalespersonStagingRecLcl.SetRange(Processed, false);
        if SalespersonStagingRecLcl.FindSet() then
            repeat
                ClearLastError();
                if not SalespersonStagingCU.Run(SalespersonStagingRecLcl) then begin
                    SalespersonStagingRecLcl."Error Message" := GetLastErrorText();
                    SalespersonStagingRecLcl.Processed := false;
                end else begin
                    SalespersonStagingRecLcl.Processed := true;
                    SalespersonStagingRecLcl."Error Message" := '';
                    SalespersonStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                SalespersonStagingRecLcl.Modify();
                Commit();
            until SalespersonStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;

    procedure ProcessContactStaging(Var ContactStagingRecPar: Record "CRX Contact Staging")
    var
        ContactStagingCU: Codeunit "CRX Contact Staging";
        ContactStagingRecLcl: Record "CRX Contact Staging";
    begin
        ContactStagingRecLcl.Copy(ContactStagingRecPar);
        ContactStagingRecLcl.SetRange(Processed, false);
        if ContactStagingRecLcl.FindSet() then
            repeat
                ClearLastError();
                if not ContactStagingCU.Run(ContactStagingRecLcl) then begin
                    ContactStagingRecLcl."Error Message" := GetLastErrorText();
                    ContactStagingRecLcl.Processed := false;
                end else begin
                    ContactStagingRecLcl.Processed := true;
                    ContactStagingRecLcl."Error Message" := '';
                    ContactStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                end;
                ContactStagingRecLcl.Modify();
                Commit();
            until ContactStagingRecLcl.Next() = 0;
        Message('Processed Successfully!');
    end;
}
codeunit 50001 "CRX Process Staging Data"
{
    trigger OnRun()
    begin

    end;

    procedure ProcessPeosStaging()
    var
        PeosStagingRecLcl: Record "CRX peos staging";
        CustomerRecLcl: Record Customer;
    begin
        PeosStagingRecLcl.Reset();
        PeosStagingRecLcl.SetRange(Processed, false);
        if PeosStagingRecLcl.FindSet() then begin
            repeat
                CustomerRecLcl.Init();
                CustomerRecLcl."No." := PeosStagingRecLcl.id;
                CustomerRecLcl.Name := PeosStagingRecLcl.company;
                if not CustomerRecLcl.Insert() then
                    CustomerRecLcl.Modify();

                PeosStagingRecLcl.Processed := true;
                PeosStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                PeosStagingRecLcl.Modify();
            until PeosStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessGroupsStaging()
    var
        GroupsStagingRecLcl: Record "CRX Groups Staging";
        CustomerRecLcl: Record Customer;
        GroupCustomerRecLcl: Record Customer;
        PeosNotFoundLbl: Label '%1 Peos not found.';
    begin
        GroupsStagingRecLcl.Reset();
        GroupsStagingRecLcl.SetRange(Processed, false);
        if GroupsStagingRecLcl.FindSet() then begin
            repeat
                CustomerRecLcl.Init();
                CustomerRecLcl."No." := GroupsStagingRecLcl.id;
                CustomerRecLcl.Name := GroupsStagingRecLcl.name;
                if not GroupCustomerRecLcl.get(GroupsStagingRecLcl.peo_id) then
                    Error(PeosNotFoundLbl, GroupsStagingRecLcl.peo_id);

                Evaluate(CustomerRecLcl."CRX Peos Id", GroupsStagingRecLcl.peo_id);
                //Evaluate(CustomerRecLcl."Salesperson Code",)
                if not CustomerRecLcl.Insert() then
                    CustomerRecLcl.Modify();

                GroupsStagingRecLcl.Processed := true;
                GroupsStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                GroupsStagingRecLcl.Modify();
            until GroupsStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessUsagesStaging()
    var
        UsagesStagingRecLcl: Record "CRX Usages Staging";
        UsagesRecLcl: Record "CRX Usages";
    begin
        UsagesStagingRecLcl.Reset();
        UsagesStagingRecLcl.SetRange(Processed, false);
        if UsagesStagingRecLcl.FindSet() then begin
            repeat
                UsagesRecLcl.Init();
                Evaluate(UsagesRecLcl."Entry No.", UsagesStagingRecLcl.id);
                UsagesRecLcl."Employee Id" := UsagesStagingRecLcl.account_id;
                UsagesRecLcl.Provider := UsagesStagingRecLcl.provider;
                UsagesRecLcl.Bin := UsagesStagingRecLcl.bin;
                UsagesRecLcl.Npi := UsagesStagingRecLcl.npi;
                UsagesRecLcl.Brand := UsagesStagingRecLcl.brand;
                UsagesRecLcl.Ndc := UsagesStagingRecLcl.ndc;
                Evaluate(UsagesRecLcl.Price, UsagesStagingRecLcl.price);
                Evaluate(UsagesRecLcl.Qty, UsagesStagingRecLcl.quantity);
                if not UsagesRecLcl.Insert() then
                    UsagesRecLcl.Modify();

                UsagesStagingRecLcl.Processed := true;
                UsagesStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                UsagesStagingRecLcl.Modify();
            until UsagesStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;

    procedure ProcessAccountStaging()
    var
        AccountsStagingRecLcl: Record "CRX Accounts Staging";
        EmployeeRecLcl: Record Employee;
        GroupIdNotFoundLbl: Label '%1 Group Id not found.';
        CustomerRecLcl: Record Customer;
    begin
        AccountsStagingRecLcl.Reset();
        AccountsStagingRecLcl.SetRange(Processed, false);
        if AccountsStagingRecLcl.FindSet() then begin
            repeat
                EmployeeRecLcl.init();
                EmployeeRecLcl."No." := AccountsStagingRecLcl.id;
                EmployeeRecLcl."First Name" := AccountsStagingRecLcl.first_name;
                EmployeeRecLcl."Last Name" := AccountsStagingRecLcl.last_name;
                EmployeeRecLcl."E-Mail" := AccountsStagingRecLcl.email;
                EmployeeRecLcl."Phone No." := AccountsStagingRecLcl.phone;
                EmployeeRecLcl."Post Code" := AccountsStagingRecLcl.zip;
                if AccountsStagingRecLcl.sex = 'male' then
                    EmployeeRecLcl.Gender := EmployeeRecLcl.Gender::Male
                else
                    if AccountsStagingRecLcl.sex = 'female' then
                        EmployeeRecLcl.Gender := EmployeeRecLcl.Gender::Female;
                EmployeeRecLcl."CRX Ethnicity" := AccountsStagingRecLcl.ethnicity;
                EmployeeRecLcl."CRX Age_range" := AccountsStagingRecLcl.age_range;

                if not CustomerRecLcl.get(AccountsStagingRecLcl.group_id) then
                    Error(GroupIdNotFoundLbl, AccountsStagingRecLcl.group_id);

                EmployeeRecLcl."CRX Group Id" := AccountsStagingRecLcl.group_id;


                if not EmployeeRecLcl.Insert() then
                    EmployeeRecLcl.Modify();


                AccountsStagingRecLcl.Processed := true;
                AccountsStagingRecLcl."Processed Data/Time" := CurrentDateTime;
                AccountsStagingRecLcl.Modify();
            until AccountsStagingRecLcl.Next() = 0;
            Message('Processed Successfully!');
        end;
    end;
}
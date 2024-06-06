pageextension 50000 "CRX Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CRX Peos Id"; rec."CRX Peos Id")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Broker Id"; rec."CRX Broker ID")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Salesperson ID"; rec."CRX Salesperson ID")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX No. of Employees"; rec."CRX No. of Employees")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Company"; rec."CRX Company")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Broker"; rec."CRX Broker")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Usages"; rec."CRX Usages")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("CRX Claim"; ClaimsVarGbl)
            {
                Caption = 'Claim';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    ClaimRecLcl: Record "CRX Claim Staging";
                    TempClaimRecLcl: Record "CRX Claim Staging" temporary;
                    EmployeeRecLcl: Record Employee;
                begin
                    TempClaimRecLcl.DeleteAll();
                    Clear(ClaimsVarGbl);
                    EmployeeRecLcl.Reset();
                    EmployeeRecLcl.SetRange("CRX Group Id", rec."No.");
                    IF EmployeeRecLcl.FindSet() then begin
                        repeat
                            ClaimRecLcl.Reset();
                            ClaimRecLcl.SetRange(account_id, EmployeeRecLcl."No.");
                            if ClaimRecLcl.FindSet() then
                                repeat
                                    TempClaimRecLcl.Init();
                                    TempClaimRecLcl.TransferFields(ClaimRecLcl);
                                    TempClaimRecLcl.Insert();
                                until ClaimRecLcl.Next() = 0;
                        until EmployeeRecLcl.Next() = 0;
                        if TempClaimRecLcl.FindSet() then
                            page.RunModal(page::"CRX Claim List", TempClaimRecLcl);
                    end;
                end;
            }
            field("CRX Groups"; rec."CRX Groups")
            {
                ApplicationArea = all;
            }
            field("CRX Group"; rec."CRX Group")
            {
                ApplicationArea = all;
            }
            field("CRX Commission %"; rec."CRX Commission %")
            {
                ApplicationArea = all;
            }
            field("CRX Commission Amount"; rec."CRX Commission Amount")
            {
                ApplicationArea = all;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        ClaimRecLcl: Record "CRX Claim Staging";
        EmployeeRecLcl: Record Employee;
    begin
        Clear(ClaimsVarGbl);
        EmployeeRecLcl.Reset();
        EmployeeRecLcl.SetRange("CRX Group Id", rec."No.");
        IF EmployeeRecLcl.FindSet() then begin
            repeat
                ClaimRecLcl.Reset();
                ClaimRecLcl.SetRange(account_id, EmployeeRecLcl."No.");
                if ClaimRecLcl.FindSet() then
                    ClaimsVarGbl += ClaimRecLcl.Count();
            until EmployeeRecLcl.Next() = 0;
        end;
    end;

    var
        ClaimsVarGbl: Integer;
}

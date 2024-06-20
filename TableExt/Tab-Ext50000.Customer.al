tableextension 50000 "CRX Customer" extends Customer
{
    fields
    {
        field(50000; "CRX Peos Id"; Code[20])
        {
            Caption = 'Peos Id';
            DataClassification = customercontent;
            tablerelation = Customer."No.";
        }
        field(50001; "CRX Broker ID"; Code[20])
        {
            Caption = 'Broker ID';
            DataClassification = customercontent;
            tablerelation = Customer."No.";
        }
        field(50002; "CRX Salesperson ID"; Code[20])
        {
            Caption = 'Salesperson ID';
            DataClassification = customercontent;
            tablerelation = "Salesperson/Purchaser".Code;
        }
        field(50003; "CRX No. of Employees"; Integer)
        {
            Caption = 'No. of Employees';
            FieldClass = FlowField;
            CalcFormula = count(Employee where("CRX Group Id" = field("No.")));
        }
        field(50004; "CRX Company"; Text[50])
        {
            Caption = 'Company';
            DataClassification = customercontent;
        }
        field(50005; "CRX Broker"; Boolean)
        {
            Caption = 'Broker';
            DataClassification = customercontent;
        }
        field(50006; "CRX Usages"; Integer)
        {
            Caption = 'Usages';
            FieldClass = FlowField;
            CalcFormula = count("CRX Usages Staging" where(group_id = field("No."), peo_id = field("CRX Peos Id")));
        }
        field(50007; "CRX Groups"; Integer)
        {
            Caption = 'Groups';
            FieldClass = FlowField;
            CalcFormula = count("CRX Groups Staging" where(id = field("No."), broker_id = field("CRX Broker ID")));
        }
        field(50008; "CRX Group"; Boolean)
        {
            Caption = 'Group';
            DataClassification = customercontent;
            Editable = false;
        }
        field(50009; "CRX Peo"; Boolean)
        {
            Caption = 'Peo';
            DataClassification = customercontent;
            Editable = false;
        }
        field(50010; "CRX Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = customercontent;

            trigger OnValidate()
            var
                ClaimRecLcl: Record "CRX Claim Staging";
                EmployeeRecLcl: Record Employee;
                FeeAmountVarLcl: Decimal;
                SumFeeAmountVarLcl: Decimal;
            begin
                Clear(FeeAmountVarLcl);
                Clear(SumFeeAmountVarLcl);

                EmployeeRecLcl.Reset();
                EmployeeRecLcl.SetRange("CRX Group Id", rec."No.");
                IF EmployeeRecLcl.findset() then begin
                    repeat
                        ClaimRecLcl.Reset();
                        ClaimRecLcl.SetRange(account_id, EmployeeRecLcl."No.");
                        if ClaimRecLcl.FindSet() then
                            repeat
                                Evaluate(FeeAmountVarLcl, ClaimRecLcl."Fee ($)");
                                SumFeeAmountVarLcl += FeeAmountVarLcl;
                            until ClaimRecLcl.Next() = 0;
                    until EmployeeRecLcl.Next() = 0;
                end;


                if SumFeeAmountVarLcl <> 0 then
                    rec."CRX Commission Amount" := (SumFeeAmountVarLcl * rec."CRX Commission %") / 100
                else
                    rec."CRX Commission Amount" := 0;
            end;
        }
        field(50011; "CRX Commission Amount"; Decimal)
        {
            Caption = 'Commission Amount';
            DataClassification = customercontent;
            Editable = false;
        }
    }

}

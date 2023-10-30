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
    }
}

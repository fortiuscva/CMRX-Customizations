tableextension 50001 "CRX Employee" extends Employee
{
    fields
    {
        field(50000; "CRX Ethnicity"; Text[100])
        {
            Caption = 'Ethnicity';
            DataClassification = CustomerContent;
        }
        field(50001; "CRX Age_range"; Text[100])
        {
            Caption = 'Age_range';
            DataClassification = CustomerContent;
        }
        field(50002; "CRX Group Id"; Code[20])
        {
            Caption = 'Group Id';
            DataClassification = CustomerContent;
            tablerelation = Customer."No.";
        }
        field(50007; "CRX Usages"; Integer)
        {
            Caption = 'Usages';
            FieldClass = FlowField;
            CalcFormula = count("CRX Usages Staging" where(account_id = field("No.")));
        }
        field(50008; "CRX Affiliate Id"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Affiliate Id';
        }
        field(50010; "CRX Claim"; Integer)
        {
            Caption = 'Claim';
            FieldClass = FlowField;
            CalcFormula = count("CRX Claim Staging" where(account_id = field("No.")));
        }
    }
}

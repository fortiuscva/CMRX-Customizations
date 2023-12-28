tableextension 50012 "CRX Salesperson/Purchaser" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; "CRX Signed Account Count"; text[250])
        {
            Caption = 'Signed Account Count';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50001; "CRX Affiliated Employees"; Integer)
        {
            Caption = 'Affiliated Employees';
            FieldClass = FlowField;
            CalcFormula = count(Employee where("CRX Affiliate Id" = field(Code)));
            Editable = false;
        }
    }
}

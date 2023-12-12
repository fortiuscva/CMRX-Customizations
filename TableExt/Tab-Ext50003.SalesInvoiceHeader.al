tableextension 50003 "CRX Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "CRX Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = ToBeClassified;
        }
    }
}

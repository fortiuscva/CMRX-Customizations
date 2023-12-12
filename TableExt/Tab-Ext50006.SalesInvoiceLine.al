tableextension 50006 "CRX Sales Invoice Line" extends "Sales Invoice Line"
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

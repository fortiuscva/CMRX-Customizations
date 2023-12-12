tableextension 50007 "CRX Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
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

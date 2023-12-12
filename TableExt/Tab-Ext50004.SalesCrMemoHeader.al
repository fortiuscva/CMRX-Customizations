tableextension 50004 "CRX Sales Cr.Memo Header" extends "Sales Cr.Memo Header"
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

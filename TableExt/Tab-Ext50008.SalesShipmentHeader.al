tableextension 50008 "CRX Sales Shipment Header" extends "Sales Shipment Header"
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

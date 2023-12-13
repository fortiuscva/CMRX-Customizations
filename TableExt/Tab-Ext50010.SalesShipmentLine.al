tableextension 50010 "CRX Sales Shipment Line" extends "Sales Shipment Line"
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

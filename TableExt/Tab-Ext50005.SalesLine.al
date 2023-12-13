tableextension 50005 "CRX Sales Line" extends "Sales Line"
{
    fields
    {
        field(50000; "CRX Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnInsert()
    var
        SalesHeaderRecLcl: Record "Sales Header";
    begin
        if SalesHeaderRecLcl.get(rec."Document Type", rec."Document No.") then
            rec."CRX Commission %" := SalesHeaderRecLcl."CRX Commission %";
    end;
}

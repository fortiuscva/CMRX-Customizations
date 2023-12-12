tableextension 50002 "CRX Sales Header" extends "Sales Header"
{
    fields
    {
        modify("Salesperson Code")
        {
            trigger OnAfterValidate()
            var
                SalespersonPurchaserRecLcl: Record "Salesperson/Purchaser";
                SalesLineRecLcl: Record "Sales Line";
            begin
                if SalespersonPurchaserRecLcl.get(rec."Salesperson Code") then begin
                    rec."CRX Commission %" := SalespersonPurchaserRecLcl."Commission %";

                    SalesLineRecLcl.Reset();
                    SalesLineRecLcl.SetRange("Document Type", rec."Document Type");
                    SalesLineRecLcl.SetRange("Document No.", rec."No.");
                    if SalesLineRecLcl.FindSet() then
                        if rec."CRX Commission %" <> 0 then
                            SalesLineRecLcl.ModifyAll("CRX Commission %", rec."CRX Commission %");
                end else
                    rec."CRX Commission %" := 0;
            end;
        }
        field(50000; "CRX Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = ToBeClassified;
        }
    }
}

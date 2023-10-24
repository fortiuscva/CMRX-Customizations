codeunit 50005 "CRX Usages Staging"
{
    TableNo = "CRX Usages Staging";

    trigger OnRun()
    var
        UsagesRecLcl: Record "CRX Usages";
    begin
        UsagesRecLcl.Init();
        Evaluate(UsagesRecLcl."Entry No.", Rec.id);
        UsagesRecLcl."Employee Id" := Rec.account_id;
        UsagesRecLcl.Provider := Rec.provider;
        UsagesRecLcl.Bin := Rec.bin;
        UsagesRecLcl.Npi := Rec.npi;
        UsagesRecLcl.Brand := Rec.brand;
        UsagesRecLcl.Ndc := Rec.ndc;
        Evaluate(UsagesRecLcl.Price, Rec.price);
        Evaluate(UsagesRecLcl.Qty, Rec.quantity);
        if not UsagesRecLcl.Insert() then
            UsagesRecLcl.Modify();
    end;
}

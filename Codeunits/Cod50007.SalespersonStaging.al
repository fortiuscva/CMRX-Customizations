codeunit 50007 "CRX Salesperson Staging"
{
    TableNo = "CRX Salesperson Staging";

    trigger OnRun()
    begin
        SalesPersonRecGbl.Init();
        SalesPersonRecGbl.Validate(code, Rec.id);
        SalesPersonRecGbl.Validate(Name, rec.name);
        SalesPersonRecGbl."E-Mail" := rec.email;
        SalesPersonRecGbl."CRX Signed Account Count" := rec.Signed_account_Count;
        if not SalesPersonRecGbl.Insert() then
            SalesPersonRecGbl.Modify();
    end;


    var
        SalesPersonRecGbl: Record "Salesperson/Purchaser";

}

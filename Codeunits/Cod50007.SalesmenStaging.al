codeunit 50007 "CRX SalesmenStaging"
{
    TableNo = "CRX Salesmen Staging";

    trigger OnRun()
    var
        SalesPersonRecGbl: Record "Salesperson/Purchaser";
    begin
        SalesPersonRecGbl.Init();
        SalesPersonRecGbl.Validate(code, Rec.id);
        SalesPersonRecGbl.Validate(Name, rec.name);
        SalesPersonRecGbl."E-Mail" := rec.email;


        if not SalesPersonRecGbl.Insert() then
            SalesPersonRecGbl.Modify();
    end;
}

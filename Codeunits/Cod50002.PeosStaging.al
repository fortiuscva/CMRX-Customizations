codeunit 50002 "CRX Peos Staging"
{
    TableNo = "CRX peos staging";

    trigger OnRun()
    var
        CustomerRecLcl: Record Customer;
    begin
        CustomerRecLcl.Init();
        CustomerRecLcl.Validate("No.", Rec.id);
        CustomerRecLcl.Validate(Name, Rec.company);
        CustomerRecLcl."CRX Peo" := true;

        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;
}

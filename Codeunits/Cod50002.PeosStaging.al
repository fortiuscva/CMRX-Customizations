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
        CustomerRecLcl.Validate("Customer Posting Group", 'DOMESTIC');
        CustomerRecLcl.Validate("Gen. Bus. Posting Group", 'DOMESTIC');

        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;
}

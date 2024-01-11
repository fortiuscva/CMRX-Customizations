codeunit 50006 "CRX Broker Staging"
{
    TableNo = "CRX Brokers Staging";

    trigger OnRun()
    var
        CustomerRecLcl: Record Customer;
        GroupCustomerRecLcl: Record Customer;
    begin
        CustomerRecLcl.Init();
        CustomerRecLcl.Validate("No.", Rec.id);
        //CustomerRecLcl.Validate(Name, rec.company);
        CustomerRecLcl."CRX Company" := rec.company;
        CustomerRecLcl."CRX Broker" := true;
        CustomerRecLcl.Validate("Customer Posting Group", 'DOMESTIC');
        CustomerRecLcl.Validate("Gen. Bus. Posting Group", 'DOMESTIC');

        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;
}

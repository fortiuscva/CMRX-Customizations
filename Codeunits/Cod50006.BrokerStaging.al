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
        CustomerRecLcl.Validate(Name, rec.company);

        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;
}

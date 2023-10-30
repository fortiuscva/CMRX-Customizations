codeunit 50006 "CRX BrokerStaging"
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
        CustomerRecLcl."CRX Broker" := true;

        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;
}

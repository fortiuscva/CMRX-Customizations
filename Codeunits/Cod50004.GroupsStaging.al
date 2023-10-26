codeunit 50004 "CRX Groups Staging"
{
    TableNo = "CRX Groups Staging";

    trigger OnRun()
    var
        CustomerRecLcl: Record Customer;
        GroupCustomerRecLcl: Record Customer;
        PeosNotFoundLbl: Label '%1 Peos not found.';
    begin
        CustomerRecLcl.Init();
        CustomerRecLcl.Validate("No.", Rec.id);
        CustomerRecLcl.Validate(Name, Rec.name);
        if Rec.peo_id <> '' then begin
            if not GroupCustomerRecLcl.get(Rec.peo_id) then
                Error(PeosNotFoundLbl, Rec.peo_id);
            Evaluate(CustomerRecLcl."CRX Peos Id", Rec.peo_id);
        end;
        CustomerRecLcl."CRX Broker ID" := rec.broker_id;
        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;

}

codeunit 50002 "CRX Peos Staging"
{
    TableNo = "CRX peos staging";

    trigger OnRun()
    var
        CustomerRecLcl: Record Customer;
    begin
        CustomerRecLcl.Init();
        CustomerRecLcl."No." := Rec.id;
        CustomerRecLcl.Name := Rec.company;
        if not CustomerRecLcl.Insert() then
            CustomerRecLcl.Modify();
    end;
}

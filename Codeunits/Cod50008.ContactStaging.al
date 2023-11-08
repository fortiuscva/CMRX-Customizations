codeunit 50008 "CRX Contact Staging"
{
    TableNo = "CRX Contact Staging";

    trigger OnRun()
    var
        ContactRecLcl: Record Contact;
        ContactBusinessRelationRecLcl: Record "Contact Business Relation";
    begin
        ContactBusinessRelationRecLcl.Init();
        ContactBusinessRelationRecLcl."Contact No." := rec.id;
        ContactBusinessRelationRecLcl.Validate("Business Relation Code", 'CUST');
        ContactBusinessRelationRecLcl."Link to Table" := ContactBusinessRelationRecLcl."Link to Table"::Customer;
        if rec.broker_id <> '' then
            ContactBusinessRelationRecLcl.Validate("No.", rec.broker_id)
        else
            if rec.group_ids <> '' then
                ContactBusinessRelationRecLcl.Validate("No.", rec.group_ids)
            else
                if rec.peo_ids <> '' then
                    ContactBusinessRelationRecLcl.Validate("No.", rec.peo_ids);

        if not ContactBusinessRelationRecLcl.Insert() then
            ContactBusinessRelationRecLcl.Modify();

        ContactRecLcl.init();
        ContactRecLcl."No." := rec.id;
        ContactRecLcl.Name := rec.name;
        ContactRecLcl."Phone No." := rec.phone;
        ContactRecLcl.Type := ContactRecLcl.Type::Person;
        ContactRecLcl."Contact Business Relation" := ContactRecLcl."Contact Business Relation"::Customer;
        ContactRecLcl."E-Mail" := rec.email;
        ContactRecLcl."Company No." := rec.id;
        ContactRecLcl."Company Name" := rec.name;

        if not ContactRecLcl.Insert() then
            ContactRecLcl.Modify();
    end;
}

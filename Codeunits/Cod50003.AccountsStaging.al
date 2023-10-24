codeunit 50003 "CRX Accounts Staging"
{
    TableNo = "CRX Accounts Staging";

    trigger OnRun()
    var
        EmployeeRecLcl: Record Employee;
        GroupIdNotFoundLbl: Label '%1 Group Id not found.';
        CustomerRecLcl: Record Customer;
    begin
        EmployeeRecLcl.init();
        EmployeeRecLcl."No." := Rec.id;
        EmployeeRecLcl."First Name" := Rec.first_name;
        EmployeeRecLcl."Last Name" := Rec.last_name;
        EmployeeRecLcl."E-Mail" := Rec.email;
        EmployeeRecLcl."Phone No." := Rec.phone;
        EmployeeRecLcl."Post Code" := Rec.zip;
        if Rec.sex = 'male' then
            EmployeeRecLcl.Gender := EmployeeRecLcl.Gender::Male
        else
            if Rec.sex = 'female' then
                EmployeeRecLcl.Gender := EmployeeRecLcl.Gender::Female;
        EmployeeRecLcl."CRX Ethnicity" := Rec.ethnicity;
        EmployeeRecLcl."CRX Age_range" := Rec.age_range;

        if not CustomerRecLcl.get(Rec.group_id) then
            Error(GroupIdNotFoundLbl, Rec.group_id);

        EmployeeRecLcl."CRX Group Id" := Rec.group_id;

        if not EmployeeRecLcl.Insert() then
            EmployeeRecLcl.Modify();
    end;

}

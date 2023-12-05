table 50009 "CRX Salesperson Staging"
{
    Caption = 'Salesperson Staging';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; id; Text[250])
        {
            Caption = 'id';
        }
        field(3; username; Text[250])
        {
            Caption = 'username';
        }
        field(4; name; Text[250])
        {
            Caption = 'name';
        }
        field(5; email; Text[250])
        {
            Caption = 'email';
        }
        field(6; created_at; Text[250])
        {
            Caption = 'created_at';
        }
        field(7; updated_at; Text[250])
        {
            Caption = 'updated_at';
        }
        field(8; total; Text[250])
        {
            Caption = 'total';
        }
        field(35; Processed; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(36; "Processed Data/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(41; "Error Message"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        SalespersonStagingRecLcl: Record "CRX Salesperson Staging";
    begin
        if SalespersonStagingRecLcl.FindLast() then
            "Entry No." := SalespersonStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

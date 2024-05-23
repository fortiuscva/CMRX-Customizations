table 50012 "CRX Distributors Staging"
{
    Caption = 'Distributors Staging';
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
        field(3; parent_id; Text[250])
        {
            Caption = 'parent_id';
        }
        field(4; tier; Text[250])
        {
            Caption = 'tier';
        }
        field(5; name; Text[250])
        {
            Caption = 'name';
        }
        field(6; email; Text[250])
        {
            Caption = 'email';
        }
        field(7; contact_name; Text[250])
        {
            Caption = 'contact_name';
        }
        field(8; contact_note; Text[250])
        {
            Caption = 'contact_note';
        }
        field(9; created_at; Text[250])
        {
            Caption = 'created_at';
        }
        field(10; updated_at; Text[250])
        {
            Caption = 'updated_at';
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
        DistributorStagingRecLcl: Record "CRX Distributors Staging";
    begin
        if DistributorStagingRecLcl.FindLast() then
            "Entry No." := DistributorStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;

}

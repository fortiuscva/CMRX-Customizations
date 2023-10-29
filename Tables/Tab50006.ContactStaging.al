table 50006 "CRX Contact Staging"
{
    Caption = 'Contact Staging';
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
        field(3; name; Text[250])
        {
            Caption = 'name';
        }
        field(4; note; Text[250])
        {
            Caption = 'note';
        }
        field(5; phone; Text[250])
        {
            Caption = 'phone';
        }
        field(6; email; Text[250])
        {
            Caption = 'email';
        }
        field(7; salesman_id; Text[250])
        {
            Caption = 'salesman_id';
        }
        field(9; broker_id; Text[250])
        {
            Caption = 'broker_id';
        }
        field(10; group_ids; Text[250])
        {
            Caption = 'group_ids';
        }
        field(11; peo_ids; Text[250])
        {
            Caption = 'peo_ids';
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
        ComtactStagingRecLcl: Record "CRX Contact Staging";
    begin
        if ComtactStagingRecLcl.FindLast() then
            "Entry No." := ComtactStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

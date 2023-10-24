table 50001 "CRX Accounts Staging"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Text[250])
        {
            DataClassification = CustomerContent;

        }
        field(2; first_name; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(3; last_name; Text[250])
        {
            DataClassification = CustomerContent;

        }
        field(4; email; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(5; phone; Text[250])
        {
            DataClassification = CustomerContent;

        }
        field(6; group_id; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(7; zip; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(8; sex; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(9; ethnicity; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(10; age_range; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(11; affiliate_id; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(12; privacy_optout; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(13; created_at; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(14; updated_at; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(35; Processed; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(36; "Processed Data/Time"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(41; "Error Message"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AccountsStagingRecLcl: Record "CRX Accounts Staging";
    begin
        if AccountsStagingRecLcl.FindLast() then
            "Entry No." := AccountsStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}
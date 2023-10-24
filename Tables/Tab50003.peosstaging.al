table 50003 "CRX peos staging"
{
    Caption = 'peos staging';
    DataClassification = ToBeClassified;

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
        field(3; company; Text[250])
        {
            Caption = 'company';
        }
        field(4; created_at; Text[250])
        {
            Caption = 'created_at';
        }
        field(5; updated_at; Text[250])
        {
            Caption = 'updated_at';
        }
        field(6; contacts; Text[250])
        {
            Caption = 'contacts';
        }
        field(7; total; text[250])
        {
            Caption = 'total';
        }
        field(20; Processed; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(21; "Processed Data/Time"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(26; "Error Message"; Text[250])
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
        PeosStagingRecLcl: Record "CRX peos staging";
    begin
        if PeosStagingRecLcl.FindLast() then
            "Entry No." := PeosStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

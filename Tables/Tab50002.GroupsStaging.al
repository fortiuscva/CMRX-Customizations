table 50002 "CRX Groups Staging"
{
    Caption = 'Groups Staging';
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
        field(3; name; Text[250])
        {
            Caption = 'name';
        }
        field(4; peo_id; Text[250])
        {
            Caption = 'peo_id';
        }
        field(5; salesman_id; Text[250])
        {
            Caption = 'salesman_id';
        }
        field(6; created_at; Text[250])
        {
            Caption = 'created_at';
        }
        field(7; updated_at; Text[250])
        {
            Caption = 'updated_at';
        }
        field(8; contacts; Text[250])
        {
            Caption = 'contacts';
        }
        field(20; Processed; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(21; "Processed Data/Time"; DateTime)
        {
            DataClassification = ToBeClassified;

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
        GroupsStagingRecLcl: Record "CRX Groups Staging";
    begin
        if GroupsStagingRecLcl.FindLast() then
            "Entry No." := GroupsStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

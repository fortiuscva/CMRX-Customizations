table 50005 "CRX API Connection Log"
{
    Caption = 'API Connection Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Error Message"; Text[1024])
        {
            Caption = 'Error Message';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}

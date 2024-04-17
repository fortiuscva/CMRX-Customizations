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
        field(2; "Distributor number"; Text[250])
        {
            Caption = 'Distributor number';
        }
        field(3; "Distributor name"; Text[250])
        {
            Caption = 'Distributor name';
        }
        field(4; "Email address"; Text[250])
        {
            Caption = 'Email address';
        }
        field(5; Contact; Text[250])
        {
            Caption = 'Contact';
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

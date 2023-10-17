table 50007 "CRX Setup"
{
    Caption = 'CRX Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary key"; Integer)
        {
            Caption = 'Primary key';
        }
        field(2; "Accounts Staging Last Sync"; DateTime)
        {
            Caption = 'Accounts Staging Last Sync';
        }
        field(3; "Group Staging Last Sync"; DateTime)
        {
            Caption = 'Group Staging Last Sync';
        }
        field(4; "Peos Staging Last Sync"; DateTime)
        {
            Caption = 'Peos Staging Last Sync';
        }
        field(5; "Usages Staging Last Sync"; DateTime)
        {
            Caption = 'Usages Staging Last Sync';
        }
        field(6; "Contact Staging Last Sync"; DateTime)
        {
            Caption = 'Contact Staging Last Sync';
        }
        field(7; "Accounts Staging URL"; Text[1024])
        {
            Caption = 'Account Staging URL';
        }
        field(8; "Group Staging URL"; Text[1024])
        {
            Caption = 'Group Staging URL';
        }
        field(9; "Peos Staging URL"; Text[1024])
        {
            Caption = 'Peos Staging URL';
        }
        field(10; "Usages Staging URL"; Text[1024])
        {
            Caption = 'Usages Staging URL';
        }
        field(11; "Contact Staging URL"; Text[1024])
        {
            Caption = 'Contact Staging URL';
        }
    }
    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
    }
}

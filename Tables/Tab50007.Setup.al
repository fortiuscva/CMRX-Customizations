table 50007 "CRX Setup"
{
    Caption = 'CRX Setup';
    DataClassification = CustomerContent;
    DrillDownPageID = "CRX Setup";
    LookupPageID = "CRX Setup";


    fields
    {
        field(1; "Primary key"; Code[10])
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
        field(12; "Brokers Staging Last Sync"; DateTime)
        {
            Caption = 'Brokers Staging Last Sync';
        }
        field(13; "Brokers Staging URL"; Text[1024])
        {
            Caption = 'Brokers Staging URL';
        }
        field(14; "Salesperson Staging Last Sync"; DateTime)
        {
            Caption = 'Salesperson Staging Last Sync';
        }
        field(15; "Salesperson Staging URL"; Text[1024])
        {
            Caption = 'Salesperson Staging URL';
        }
        field(16; "Base URL"; Text[1024])
        {
            Caption = 'Base URL';
        }
        field(17; "Distributor URL"; Text[1024])
        {
            Caption = 'Distributor URL';
        }
        field(18; "Distributor Staging Last Sync"; DateTime)
        {
            Caption = 'Distributor Staging Last Sync';
        }
        field(19; "Claim Staging Last Sync"; DateTime)
        {
            Caption = 'Claim Staging Last Sync';
        }
        field(20; "Claim Staging URL"; Text[1024])
        {
            Caption = 'Claim Staging URL';
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

table 50005 "CRX Usages"
{
    Caption = 'Usages';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Employee Id"; Code[20])
        {
            Caption = 'Employee Id';
        }
        field(3; Provider; Text[100])
        {
            Caption = 'Provider';
        }
        field(4; Bin; Text[100])
        {
            Caption = 'Bin';
        }
        field(5; Npi; Text[100])
        {
            Caption = 'Npi';
        }
        field(6; Brand; Text[100])
        {
            Caption = 'Brand';
        }
        field(7; Ndc; Text[100])
        {
            Caption = 'Ndc';
        }
        field(8; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(9; Qty; Decimal)
        {
            Caption = 'Qty';
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

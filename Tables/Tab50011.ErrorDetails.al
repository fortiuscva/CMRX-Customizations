table 50011 "CRX Error Details"
{
    Caption = 'Error Details';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Discount Card Entry No."; Integer)
        {
            Caption = 'Discount Card Entry No.';
        }
        field(3; Comment; Text[1024])
        {
            Caption = 'Comment';
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
        ErrorDetailsRecLcl: Record "CRX Error Details";
    begin
        if ErrorDetailsRecLcl.FindLast() then
            "Entry No." := ErrorDetailsRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

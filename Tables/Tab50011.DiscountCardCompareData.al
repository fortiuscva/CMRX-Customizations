table 50011 "CRX Discount Card Compare Data"
{
    Caption = 'Discount Card Compare Data';
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
        DiscountCardCompareDataRecLcl: Record "CRX Discount Card Compare Data";
    begin
        if DiscountCardCompareDataRecLcl.FindLast() then
            "Entry No." := DiscountCardCompareDataRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

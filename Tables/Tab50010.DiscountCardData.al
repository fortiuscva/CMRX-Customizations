table 50010 "CRX Discount Card Data"
{
    Caption = 'Discount Card Data';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; BIN; Text[250])
        {
            Caption = 'BIN';
        }
        field(3; "DATE Submitted"; Text[250])
        {
            Caption = 'DATE Submitted';
        }
        field(4; "Prescriber NPI"; Text[250])
        {
            Caption = 'Prescriber NPI';
        }
        field(5; NDC; Text[250])
        {
            Caption = 'NDC';
        }
        field(6; Quantity; Text[250])
        {
            Caption = 'Quantity';
        }
        field(7; Price; Text[250])
        {
            Caption = 'Price';
        }
        field(8; "Record Status"; Enum "CRX Record Status")
        {
            Caption = 'Record Status';
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
        DiscountCardDataRecLcl: Record "CRX Discount Card Data";
    begin
        if DiscountCardDataRecLcl.FindLast() then
            "Entry No." := DiscountCardDataRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

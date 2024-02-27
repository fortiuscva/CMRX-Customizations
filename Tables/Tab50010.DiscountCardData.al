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
        field(8; "Compare Status"; Enum "CRX Show Details")
        {
            Caption = 'Compare Status';
        }
        field(10; "Import DateTime"; DateTime)
        {
            Caption = 'Import Date & Time';
        }
        field(11; "Compare DateTime"; DateTime)
        {
            Caption = 'Compare  Date & Time';
        }
        field(12; "Drug Name"; text[250])
        {
            Caption = 'Drug Name';
        }
        field(14; "Member ID"; Text[250])
        {
            Caption = 'Member ID';
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

        "Import DateTime" := CurrentDateTime;
    end;
}

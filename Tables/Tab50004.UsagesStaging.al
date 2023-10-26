table 50004 "CRX Usages Staging"
{
    Caption = 'Usages Staging';
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
        field(3; account_id; Text[250])
        {
            Caption = 'account_id';
        }
        field(4; provider; Text[250])
        {
            Caption = 'provider';
        }
        field(5; bin; Text[250])
        {
            Caption = 'bin';
        }
        field(6; npi; Text[250])
        {
            Caption = 'npi';
        }
        field(7; brand; Text[250])
        {
            Caption = 'brand';
        }
        field(8; ndc; Text[250])
        {
            Caption = 'ndc';
        }
        field(9; drug_name; Text[250])
        {
            Caption = 'drug_name';
        }
        field(10; extra; Text[250])
        {
            Caption = 'extra';
        }
        field(11; price; Text[250])
        {
            Caption = 'price';
        }
        field(12; quantity; Text[250])
        {
            Caption = 'quantity';
        }
        field(13; created_at; Text[250])
        {
            Caption = 'created_at';
        }
        field(14; member_id; Text[250])
        {
            Caption = 'member_id';
        }
        field(15; group_id; Text[250])
        {
            Caption = 'group_id';
        }
        field(16; email; Text[250])
        {
            Caption = 'email';
        }
        field(17; phone; Text[250])
        {
            Caption = 'phone';
        }
        field(18; age_range; Text[250])
        {
            Caption = 'age_range';
        }
        field(19; ethnicity; Text[250])
        {
            Caption = 'ethnicity';
        }
        field(20; sex; Text[250])
        {
            Caption = 'sex';
        }
        field(21; first_name; Text[250])
        {
            Caption = 'first_name';
        }
        field(22; last_name; Text[250])
        {
            Caption = 'last_name';
        }
        field(23; account_zip; Text[250])
        {
            Caption = 'account_zip';
        }
        field(24; group_name; Text[250])
        {
            Caption = 'group_name';
        }
        field(25; peo_company; Text[250])
        {
            Caption = 'peo_company';
        }
        field(26; peo_id; Text[250])
        {
            Caption = 'peo_id';
        }
        field(27; privacy_optout; Text[250])
        {
            Caption = 'privacy_optout';
        }
        field(28; Dosage; text[250])
        {
            Caption = 'Dosage';
        }
        field(29; total; text[250])
        {
            Caption = 'total';
        }
        field(30; broker_company; Text[250])
        {
            Caption = 'broker_company';
        }
        field(31; broker_id; Text[250])
        {
            Caption = 'broker_id';
        }
        field(35; Processed; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(36; "Processed Data/Time"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(41; "Error Message"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
        UsagesStagingRecLcl: Record "CRX Usages Staging";
    begin
        if UsagesStagingRecLcl.FindLast() then
            "Entry No." := UsagesStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

table 50008 "CRX Brokers Staging"
{
    Caption = 'Brokers Staging';
    DataClassification = CustomerContent;

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
        field(3; company; Text[250])
        {
            Caption = 'company';
        }
        field(4; created_at; Text[250])
        {
            Caption = 'created_at';
        }
        field(5; updated_at; Text[250])
        {
            Caption = 'updated_at';
        }
        field(6; total; Text[250])
        {
            Caption = 'total';
        }
        field(35; Processed; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(36; "Processed Data/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;

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
        BrokersStagingRecLcl: Record "CRX Brokers Staging";
    begin
        if BrokersStagingRecLcl.FindLast() then
            "Entry No." := BrokersStagingRecLcl."Entry No." + 1
        else
            "Entry No." := 1;
    end;
}

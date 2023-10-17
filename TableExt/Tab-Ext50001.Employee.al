tableextension 50001 "CRX Employee" extends Employee
{
    fields
    {
        field(50000; "CRX Ethnicity"; Text[100])
        {
            Caption = 'Ethnicity';
            DataClassification = CustomerContent;
        }
        field(50001; "CRX Age_range"; Text[100])
        {
            Caption = 'Age_range';
            DataClassification = CustomerContent;
        }
        field(50002; "CRX Group Id"; Code[20])
        {
            DataClassification = CustomerContent;
            tablerelation = Customer."No.";
        }
    }
}

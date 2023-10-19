tableextension 50000 "CRX Customer" extends Customer
{
    fields
    {
        field(50000; "CRX Peos Id"; Code[20])
        {
            Caption = 'Peos Id';
            DataClassification = customercontent;
            tablerelation = Customer."No.";
        }
    }
}

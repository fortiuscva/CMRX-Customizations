table 50000 "CRX Access Token"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; UserName; Text[50])
        {
            DataClassification = CustomerContent;

        }
        field(2; UserPassword; Text[50])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = Masked;
        }
        field(3; "Access Token"; text[2048])
        {
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(Key1; UserName, UserPassword)
        {
            Clustered = true;
        }
    }
}
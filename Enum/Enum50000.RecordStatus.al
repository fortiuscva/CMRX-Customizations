enum 50000 "CRX Record Status"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = 'UnProcessed';
    }
    value(1; Matched)
    {
        Caption = 'Matched';
    }
    value(2; Unmatched)
    {
        Caption = 'Unmatched';
    }
}

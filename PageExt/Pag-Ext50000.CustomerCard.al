pageextension 50000 "CRX Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CRX Peos Id"; rec."CRX Peos Id")
            {
                ApplicationArea = all;
            }
        }
    }
}

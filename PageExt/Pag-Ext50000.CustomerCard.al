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
            field("CRX Group Id"; rec."CRX Broker ID")
            {
                ApplicationArea = all;
            }
            field("CRX Salesperson ID"; rec."CRX Salesperson ID")
            {
                ApplicationArea = all;
            }
            field("CRX No. of Employees"; rec."CRX No. of Employees")
            {
                ApplicationArea = all;
            }
            field("CRX Insurance"; rec."CRX Insurance")
            {
                ApplicationArea = all;
            }
            field("CRX Broker"; rec."CRX Broker")
            {
                ApplicationArea = all;
            }
            field("CRX Usages"; rec."CRX Usages")
            {
                ApplicationArea = all;
            }
            field("CRX Groups"; rec."CRX Groups")
            {
                ApplicationArea = all;
            }
        }
    }
}

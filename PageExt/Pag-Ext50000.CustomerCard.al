pageextension 50000 "CRX Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CRX Peos Id"; rec."CRX Peos Id")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Broker Id"; rec."CRX Broker ID")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Salesperson ID"; rec."CRX Salesperson ID")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX No. of Employees"; rec."CRX No. of Employees")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Company"; rec."CRX Company")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Broker"; rec."CRX Broker")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Usages"; rec."CRX Usages")
            {
                ApplicationArea = all;
            }
            field("CRX Groups"; rec."CRX Groups")
            {
                ApplicationArea = all;
            }
            field("CRX Group"; rec."CRX Group")
            {
                ApplicationArea = all;
            }
            field("CRX Commission %"; rec."CRX Commission %")
            {
                ApplicationArea = all;
            }
            field("CRX Commission Amount"; rec."CRX Commission Amount")
            {
                ApplicationArea = all;
            }
        }
    }
}

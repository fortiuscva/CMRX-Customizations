pageextension 50003 "CRX Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
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

pageextension 50006 "CRX Salesperson/Purchaser Card" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(General)
        {
            field("CRX Signed Account Count"; rec."CRX Signed Account Count")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Signed Account Count';
            }
            field("CRX Employee Affiliate Id"; rec."CRX Employee Affiliate Id")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Employee Affiliate Id';
            }
        }
    }
}

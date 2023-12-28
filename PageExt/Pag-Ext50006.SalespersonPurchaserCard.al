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
            field("CRX Affiliated Employees"; rec."CRX Affiliated Employees")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Affiliated Employees';
                Visible = false;
            }
        }
    }
}

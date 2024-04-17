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
            field("CRX Main_Distributor_ID"; rec."CRX Main_Distributor_ID")
            {
                ToolTip = 'Main_Distributor_ID received in the Response';
                ApplicationArea = all;
                Editable = false;
            }
            field("CRX Sub_Distributor_ID"; rec."CRX Sub_Distributor_ID")
            {
                ToolTip = 'Sub_Distributor_ID received in the Response';
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
}

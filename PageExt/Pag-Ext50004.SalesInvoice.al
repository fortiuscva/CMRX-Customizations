pageextension 50004 "CRX Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("CRX Commission %"; rec."CRX Commission %")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Commission % from Sales Invoice Header';
                Editable = false;
            }
        }
    }
}

pageextension 50005 "CRX Sales Invoice Subform" extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
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

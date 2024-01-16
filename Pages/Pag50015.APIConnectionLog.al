page 50015 "CRX API Connection Log"
{
    ApplicationArea = All;
    Caption = 'API Connection Log';
    PageType = List;
    SourceTable = "CRX API Connection Log";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Error Message"; Rec."Error Message")
                {
                    ToolTip = 'Specifies the value of the Error Message field.';
                }
            }
        }
    }
}

page 50018 "CRX Error Details"
{
    ApplicationArea = All;
    Caption = 'Error Details';
    PageType = CardPart;
    SourceTable = "CRX Error Details";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Comment; Rec.Comment)
                {
                    Caption = '';
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }
}

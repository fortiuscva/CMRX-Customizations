page 50018 "CRX Discount Card Compare Data"
{
    ApplicationArea = All;
    Caption = 'Discount Card Compare Data';
    PageType = CardPart;
    SourceTable = "CRX Discount Card Compare Data";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }
}

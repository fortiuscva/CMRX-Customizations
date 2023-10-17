page 50005 "CRX Usages"
{
    ApplicationArea = All;
    Caption = 'Usages';
    PageType = List;
    SourceTable = "CRX Usages";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Employee Id"; Rec."Employee Id")
                {
                    ToolTip = 'Specifies the value of the Employee Id field.';
                }
                field(Provider; Rec.Provider)
                {
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field(Bin; Rec.Bin)
                {
                    ToolTip = 'Specifies the value of the Bin field.';
                }
                field(Npi; Rec.Npi)
                {
                    ToolTip = 'Specifies the value of the Npi field.';
                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.';
                }
                field(Ndc; Rec.Ndc)
                {
                    ToolTip = 'Specifies the value of the Ndc field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Qty; Rec.Qty)
                {
                    ToolTip = 'Specifies the value of the Qty field.';
                }
            }
        }
    }
}

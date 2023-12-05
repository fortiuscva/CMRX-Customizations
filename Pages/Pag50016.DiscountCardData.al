page 50016 "CRX Discount Card Data"
{
    ApplicationArea = All;
    Caption = 'Discount Card Data';
    PageType = List;
    SourceTable = "CRX Discount Card Data";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(BIN; Rec.BIN)
                {
                    ToolTip = 'Specifies the value of the BIN field.';
                }
                field("DATE Submitted"; Rec."DATE Submitted")
                {
                    ToolTip = 'Specifies the value of the DATE Submitted field.';
                }
                field("Prescriber NPI"; Rec."Prescriber NPI")
                {
                    ToolTip = 'Specifies the value of the Prescriber NPI field.';
                }
                field(NDC; Rec.NDC)
                {
                    ToolTip = 'Specifies the value of the NDC field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field("Import DateTime"; Rec."Import DateTime")
                {
                    ToolTip = 'Specifies the value of the Import DateTime field.';
                }
                field("Compare DateTime"; Rec."Compare DateTime")
                {
                    ToolTip = 'Specifies the value of the Compare DteTime field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportData)
            {
                ApplicationArea = all;
                Caption = 'Import Data';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Import;

                trigger OnAction()
                var
                    ImportDiscountCardXmlportLcl: XmlPort "CRX Import Discount Card Data";
                begin
                    ImportDiscountCardXmlportLcl.Run();
                end;
            }
        }
    }
}

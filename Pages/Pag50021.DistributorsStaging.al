page 50021 "CRX Distributors Staging"
{
    ApplicationArea = All;
    Caption = 'Distributors Staging';
    PageType = List;
    SourceTable = "CRX Distributors Staging";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Distributor number"; Rec."Distributor number")
                {
                    ToolTip = 'Specifies the value of the Distributor number field.';
                }
                field("Distributor name"; Rec."Distributor name")
                {
                    ToolTip = 'Specifies the value of the Distributor name field.';
                }
                field("Email address"; Rec."Email address")
                {
                    ToolTip = 'Specifies the value of the Email address field.';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.';
                }
            }
        }
    }
}

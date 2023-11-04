page 50014 "CRX Salesperson List"
{
    ApplicationArea = All;
    Caption = 'Salesperson List';
    CardPageID = "Salesperson/Purchaser Card";
    Editable = false;
    PageType = List;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Salesperson/Purchaser";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the record.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the name of the record.';
                }
                field("Commission %"; Rec."Commission %")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the percentage to use to calculate the salesperson''s commission.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the salesperson''s or purchaser''s telephone number.';
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                    Visible = false;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action(Groups)
            {
                ApplicationArea = All;
                Caption = 'Groups';
                Image = List;
                ToolTip = 'View Gorups processed entries.';
                RunObject = Page "CRX Groups List";
                RunPageLink = "CRX Salesperson ID" = field(Code);
            }
        }
    }
}

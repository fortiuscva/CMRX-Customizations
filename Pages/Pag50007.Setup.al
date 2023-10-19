page 50007 "CRX Setup"
{
    ApplicationArea = All;
    Caption = 'CRX Setup';
    PageType = Card;
    SourceTable = "CRX Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Integration';
                field("Accounts Staging URL"; rec."Accounts Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Group Staging URL"; rec."Group Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Peos Staging URL"; rec."Peos Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Usages Staging URL"; rec."Usages Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Contact Staging URL"; rec."Contact Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Accounts Staging Last Sync"; Rec."Accounts Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Accounts Staging Last Sync field.';
                }

                field("Group Staging Last Sync"; Rec."Group Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Group Staging Last Sync field.';
                }
                field("Peos Staging Last Sync"; Rec."Peos Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Peos Staging Last Sync field.';
                }
                field("Usages Staging Last Sync"; Rec."Usages Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Usages Staging Last Sync field.';
                }
                field("Contact Staging Last Sync"; Rec."Contact Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Contact Staging Last Sync field.';
                }
            }
        }
    }
}

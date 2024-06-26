page 50007 "CRX Setup"
{
    ApplicationArea = All;
    Caption = 'CMRX Setup';
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
                field("Base URL"; rec."Base URL")
                {
                    ApplicationArea = all;
                }
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
                field("Brokers Staging URL"; rec."Brokers Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Salesperson Staging URL"; rec."Salesperson Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Distributor URL"; rec."Distributor URL")
                {
                    ApplicationArea = all;
                }
                field("Claim Staging URL"; rec."Claim Staging URL")
                {
                    ApplicationArea = all;
                }
                field("Accounts Staging Last Sync"; Rec."Accounts Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Accounts Staging Last Sync field.';
                    Editable = false;
                }

                field("Group Staging Last Sync"; Rec."Group Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Group Staging Last Sync field.';
                    Editable = false;
                }
                field("Peos Staging Last Sync"; Rec."Peos Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Peos Staging Last Sync field.';
                    Editable = false;
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
                    Editable = false;
                }
                field("Brokers Staging Last Sync"; rec."Brokers Staging Last Sync")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Salesperson Staging Last Sync"; rec."Salesperson Staging Last Sync")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Distributor Staging Last Sync"; rec."Distributor Staging Last Sync")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Claim Staging Last Sync"; Rec."Claim Staging Last Sync")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Claim Staging Last Sync field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Test Connection")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;

                trigger OnAction()
                var
                    APIAccessTokenMgtCULcl: Codeunit "CRX Access Token Management";
                begin
                    APIAccessTokenMgtCULcl.TestConnection();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

pageextension 50002 "CRX Order Processor RoleCentr" extends "Order Processor Role Center"
{
    actions
    {
        addafter("Posted Documents")
        {
            group("CRX CMRX")
            {
                Caption = 'CMRX';

                group("CRX API Setup")
                {
                    Caption = 'API Setup';

                    action("CRX Access Token")
                    {
                        ApplicationArea = Location;
                        Caption = 'Access Token';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX Access Token";
                        ToolTip = 'Manage the Integration Data for Access Token';
                    }
                    action("CRX Setup")
                    {
                        ApplicationArea = Location;
                        Caption = 'CRX Setup';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX Setup";
                        ToolTip = 'Manage the Integration Data for CRX Setup';
                    }
                }
                group("CRX API Integration")
                {
                    Caption = 'API Integration';
                    action("CRX peos staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Peos Staging';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX peos staging";
                        ToolTip = 'Manage the Integration Data for Peos Staging';
                    }
                    action("CRX Groups Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Groups Staging';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX Groups Staging";
                        ToolTip = 'Manage the Integration Data for Groups Staging';
                    }
                    action("CRX Accounts Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Accounts Staging';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX Accounts Staging";
                        ToolTip = 'Manage the Integration Data for Accounts Staging';
                    }
                    action("CRX Usages Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Usages Staging';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX Usages Staging";
                        ToolTip = 'Manage the Integration Data for Usages Staging';
                    }
                    action("CRX Contact Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Contact Staging';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "CRX Contact Staging";
                        ToolTip = 'Manage the Integration Data for Contact Staging';
                    }
                }
            }
        }
    }
}

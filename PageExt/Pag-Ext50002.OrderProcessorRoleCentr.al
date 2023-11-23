pageextension 50002 "CRX Order Processor RoleCentr" extends "Order Processor Role Center"
{
    actions
    {
        addafter("Transfer Orders")
        {
            action("CRX CRX_Peos")
            {
                ApplicationArea = All;
                Caption = 'Peos';
                RunObject = Page "CRX Peos List";
                RunPageLink = "CRX Peo" = const(true);
                ToolTip = 'Opens the Poes List';
            }
            action("CRX CRX_Groups")
            {
                ApplicationArea = All;
                Caption = 'Groups';
                RunObject = Page "CRX Groups List";
                RunPageLink = "CRX Group" = const(true);
                ToolTip = 'Opens the Groups';
            }
            action("CRX Brokers_List")
            {
                ApplicationArea = All;
                Caption = 'Brokers';
                RunObject = Page "CRX Brokers List";
                RunPageLink = "CRX Broker" = const(true);
                ToolTip = 'Opens the Brokers';
            }
            action("CRX Employee_List")
            {
                ApplicationArea = All;
                Caption = 'Employee';
                RunObject = Page "CRX Employee List";
                ToolTip = 'Opens the Employee';
            }
            action("CRX Salesperson_List")
            {
                ApplicationArea = All;
                Caption = 'Salesperson';
                RunObject = Page "CRX Salesperson List";
                ToolTip = 'Opens the Salesperson';
            }
        }
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
                        RunObject = Page "CRX Access Token";
                        ToolTip = 'Manage the Integration Data for Access Token';
                    }
                    action("CRX Setup")
                    {
                        ApplicationArea = Location;
                        Caption = 'CRX Setup';
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
                        RunObject = Page "CRX peos staging";
                        ToolTip = 'Manage the Integration Data for Peos Staging';
                    }
                    action("CRX Groups Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Groups Staging';
                        RunObject = Page "CRX Groups Staging";
                        ToolTip = 'Manage the Integration Data for Groups Staging';
                    }
                    action("CRX Accounts Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Accounts Staging';
                        RunObject = Page "CRX Accounts Staging";
                        ToolTip = 'Manage the Integration Data for Accounts Staging';
                    }
                    action("CRX Usages Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Usages Staging';
                        RunObject = Page "CRX Usages Staging";
                        ToolTip = 'Manage the Integration Data for Usages Staging';
                    }
                    action("CRX Contact Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Contact Staging';
                        RunObject = Page "CRX Contact Staging";
                        ToolTip = 'Manage the Integration Data for Contact Staging';
                    }
                    action("CRX Brokers Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Brokers Staging';
                        RunObject = Page "CRX Brokers Staging";
                        ToolTip = 'Manage the Integration Data for Brokers Staging';
                    }
                    action("CRX Salesperson Staging")
                    {
                        ApplicationArea = Location;
                        Caption = 'Salesperson Staging';
                        RunObject = Page "CRX Salesperson Staging";
                        ToolTip = 'Manage the Integration Data for Salesperson Staging';
                    }
                    action("CRX Get Data(All API)")
                    {
                        ApplicationArea = all;
                        Caption = 'Get Data(All API)';
                        RunObject = codeunit "CRX Access Token Management";
                        ToolTip = 'Fetch all APIs at onnce';
                    }
                }
                group("CRX BC")
                {
                    Caption = 'BC';
                    action("CRX Peos")
                    {
                        ApplicationArea = All;
                        Caption = 'Peos';
                        RunObject = Page "CRX Peos List";
                        RunPageLink = "CRX Peo" = const(true);
                        ToolTip = 'Opens the Poes List';
                    }
                    action("CRX Groups")
                    {
                        ApplicationArea = All;
                        Caption = 'Groups';
                        RunObject = Page "CRX Groups List";
                        RunPageLink = "CRX Group" = const(true);
                        ToolTip = 'Opens the Groups';
                    }
                    action("CRX Brokers List")
                    {
                        ApplicationArea = All;
                        Caption = 'Brokers';
                        RunObject = Page "CRX Brokers List";
                        RunPageLink = "CRX Broker" = const(true);
                        ToolTip = 'Opens the Brokers';
                    }
                    action("CRX Employee List")
                    {
                        ApplicationArea = All;
                        Caption = 'Employee';
                        RunObject = Page "CRX Employee List";
                        ToolTip = 'Opens the Employee';
                    }
                    action("CRX Salesperson List")
                    {
                        ApplicationArea = All;
                        Caption = 'Salesperson';
                        RunObject = Page "CRX Salesperson List";
                        ToolTip = 'Opens the Salesperson';
                    }
                    action("CRX Discount Card Data")
                    {
                        ApplicationArea = All;
                        Caption = 'Discount Card Data';
                        RunObject = Page "CRX Discount Card Data";
                        ToolTip = 'Opens the Discount Card Data';
                    }
                    action("CRX Discount Card Data Reconcillation")
                    {
                        ApplicationArea = All;
                        Caption = 'Discount Card Data Reconcillation';
                        RunObject = Page "Discount Card Reconcillation";
                        ToolTip = 'Opens the Discount Card Data Reconcillation';
                    }
                }
            }
        }
    }
}

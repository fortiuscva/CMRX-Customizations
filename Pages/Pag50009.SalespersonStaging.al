page 50009 "CRX Salesperson Staging"
{
    ApplicationArea = All;
    Caption = 'Salesperson Staging';
    PageType = List;
    SourceTable = "CRX Salesperson Staging";
    UsageCategory = Lists;
    DeleteAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Processed; rec.Processed)
                {
                    ApplicationArea = all;
                }
                field("Processed Data/Time"; rec."Processed Data/Time")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(username; Rec.username)
                {
                    ToolTip = 'Specifies the value of the username field.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(email; Rec.email)
                {
                    ToolTip = 'Specifies the value of the email field.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(updated_at; Rec.updated_at)
                {
                    ToolTip = 'Specifies the value of the updated_at field.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(total; rec.total)
                {
                    ToolTip = 'Total No. of lines received in the Response';
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetData)
            {
                ApplicationArea = all;
                Caption = 'Get Data';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = GetEntries;

                trigger OnAction()
                var
                    AccessTokenMgtCULcl: Codeunit "CRX Access Token Management";
                begin
                    AccessTokenMgtCULcl.GetSalespersonData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;
                Caption = 'Process Data';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Process;

                trigger OnAction()
                var
                    SalespersonStaging: Record "CRX Salesperson Staging";
                    ProcessStagingDataCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(SalespersonStaging);
                    ProcessStagingDataCULcl.ProcessSalespersonStaging(SalespersonStaging);
                end;
            }
        }
    }
}

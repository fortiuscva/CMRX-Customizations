page 50009 "CRX Salesmen Staging"
{
    ApplicationArea = All;
    Caption = 'Salesmen Staging';
    PageType = List;
    SourceTable = "CRX Salesmen Staging";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(username; Rec.username)
                {
                    ToolTip = 'Specifies the value of the username field.';
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.';
                }
                field(email; Rec.email)
                {
                    ToolTip = 'Specifies the value of the email field.';
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(updated_at; Rec.updated_at)
                {
                    ToolTip = 'Specifies the value of the updated_at field.';
                }
                field(total; rec.total)
                {
                    ApplicationArea = all;
                    ToolTip = 'Total No. of lines received in the Response';
                }
                field(Processed; rec.Processed)
                {
                    ApplicationArea = all;
                }
                field("Processed Data/Time"; rec."Processed Data/Time")
                {
                    ApplicationArea = all;
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

                trigger OnAction()
                var
                    AccessTokenMgtCULcl: Codeunit "CRX Access Token Management";
                begin
                    AccessTokenMgtCULcl.GetSalesmenData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;


                trigger OnAction()
                var
                    SalesmentStaging: Record "CRX Salesmen Staging";
                    ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(SalesmentStaging);
                    ProcessStagingDataaCULcl.ProcessSalemenStaging(SalesmentStaging);
                end;
            }
        }
    }
}

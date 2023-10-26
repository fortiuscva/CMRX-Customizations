page 50008 "CRX Brokers Staging"
{
    ApplicationArea = All;
    Caption = 'Brokers Staging';
    PageType = List;
    SourceTable = "CRX Brokers Staging";
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
                field(company; Rec.company)
                {
                    ToolTip = 'Specifies the value of the company field.';
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(updated_at; Rec.updated_at)
                {
                    ToolTip = 'Specifies the value of the updated_at field.';
                }
                field(total; Rec.total)
                {
                    ToolTip = 'Specifies the value of the total field.';
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
                    AccessTokenMgtCULcl.GetBrokersData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;


                trigger OnAction()
                var
                    BrokersStaging: Record "CRX Brokers Staging";
                    ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(BrokersStaging);
                    ProcessStagingDataaCULcl.ProcessBrokerStaging(BrokersStaging);
                end;
            }
        }
    }
}

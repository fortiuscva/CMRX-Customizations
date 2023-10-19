page 50002 "CRX Groups Staging"
{
    ApplicationArea = All;
    Caption = 'Groups Staging';
    PageType = List;
    SourceTable = "CRX Groups Staging";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(name; Rec.name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the name field.';
                }
                field(peo_id; Rec.peo_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_id field.';
                }
                field(salesman_id; Rec.salesman_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the salesman_id field.';
                }
                field(created_at; Rec.created_at)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(updated_at; Rec.updated_at)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the updated_at field.';
                }
                field(contacts; Rec.contacts)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the contacts field.';
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
                    AccessTokenMgtCULcl.GetGroupData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;


                trigger OnAction()
                var
                    ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
                begin
                    ProcessStagingDataaCULcl.ProcessGroupsStaging();
                end;
            }
        }
    }
}

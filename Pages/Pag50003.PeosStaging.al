page 50003 "CRX Peos Staging"
{
    ApplicationArea = All;
    Caption = 'Peos Staging';
    PageType = List;
    SourceTable = "CRX peos staging";
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
                field(company; Rec.company)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the company field.';
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
                field(total; rec.total)
                {
                    ApplicationArea = all;
                    ToolTip = 'Total No. of lines received in the Response';
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Stores the reason for not processing the record.';
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
                    AccessTokenMgtCULcl.GetPeosData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;

                trigger OnAction()
                var
                    PeosStaging: Record "CRX peos staging";
                    ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(PeosStaging);
                    ProcessStagingDataaCULcl.ProcessPeosStaging(PeosStaging);
                end;
            }
        }
    }
}

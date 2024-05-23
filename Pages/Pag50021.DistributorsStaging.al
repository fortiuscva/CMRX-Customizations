page 50021 "CRX Distributors Staging"
{
    ApplicationArea = All;
    Caption = 'Distributors Staging';
    PageType = List;
    SourceTable = "CRX Distributors Staging";
    UsageCategory = Lists;

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
                }
                field(parent_id; Rec.parent_id)
                {
                    ToolTip = 'Specifies the value of the parent_id field.';
                }
                field(tier; Rec.tier)
                {
                    ToolTip = 'Specifies the value of the tier field.';
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.';
                }
                field(contact_name; Rec.contact_name)
                {
                    ToolTip = 'Specifies the value of the contact_name field.';
                }
                field(email; Rec.email)
                {
                    ToolTip = 'Specifies the value of the email field.';
                }
                field(contact_note; Rec.contact_note)
                {
                    ToolTip = 'Specifies the value of the contact_note field.';
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(updated_at; Rec.updated_at)
                {
                    ToolTip = 'Specifies the value of the updated_at field.';
                }

                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Stores the reason for not processing the record.';
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
                    AccessTokenMgtCULcl.GetDistributorData();
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
                    DistributorStaging: Record "CRX Distributors Staging";
                    ProcessStagingDataCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(DistributorStaging);
                    ProcessStagingDataCULcl.ProcessDistributorStaging(DistributorStaging);
                end;
            }
        }
    }
}

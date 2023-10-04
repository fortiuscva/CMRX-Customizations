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
                field(contacts; Rec.contacts)
                {
                    ToolTip = 'Specifies the value of the contacts field.';
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
        }
    }
}

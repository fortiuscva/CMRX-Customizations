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
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.';
                }
                field(peo_id; Rec.peo_id)
                {
                    ToolTip = 'Specifies the value of the peo_id field.';
                }
                field(salesman_id; Rec.salesman_id)
                {
                    ToolTip = 'Specifies the value of the salesman_id field.';
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
                    AccessTokenMgtCULcl.GetGroupData();
                end;
            }
        }
    }
}

page 50000 "CRX Access Token"
{
    ApplicationArea = All;
    Caption = 'Access Token';
    PageType = List;
    SourceTable = "CRX Access Token";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the UserName field.';
                }
                field(UserPassword; Rec.UserPassword)
                {
                    ToolTip = 'Specifies the value of the UserPassword field.';
                }
                field("Access Token"; Rec."Access Token")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Access Token field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GenerateAccessToken)
            {
                ApplicationArea = all;

                trigger OnAction()
                var
                    AccessTokenMgt: Codeunit "CRX Access Token Management";
                begin
                    AccessTokenMgt.GenerateAccessToken();
                end;
            }
        }
    }
}

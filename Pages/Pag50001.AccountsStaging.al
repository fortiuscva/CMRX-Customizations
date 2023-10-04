page 50001 "CRX Accounts Staging"
{
    ApplicationArea = All;
    Caption = 'Accounts Staging';
    PageType = List;
    SourceTable = "CRX Accounts Staging";
    UsageCategory = Lists;
    Editable = false;

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
                field(first_name; Rec.first_name)
                {
                    ToolTip = 'Specifies the value of the first_name field.';
                }
                field(last_name; Rec.last_name)
                {
                    ToolTip = 'Specifies the value of the last_name field.';
                }
                field(email; Rec.email)
                {
                    ToolTip = 'Specifies the value of the email field.';
                }
                field(phone; Rec.phone)
                {
                    ToolTip = 'Specifies the value of the phone field.';
                }
                field(group_id; Rec.group_id)
                {
                    ToolTip = 'Specifies the value of the group_id field.';
                }
                field(zip; Rec.zip)
                {
                    ToolTip = 'Specifies the value of the zip field.';
                }
                field(sex; Rec.sex)
                {
                    ToolTip = 'Specifies the value of the sex field.';
                }
                field(ethnicity; Rec.ethnicity)
                {
                    ToolTip = 'Specifies the value of the ethnicity field.';
                }
                field(age_range; Rec.age_range)
                {
                    ToolTip = 'Specifies the value of the age_range field.';
                }
                field(affiliate_id; Rec.affiliate_id)
                {
                    ToolTip = 'Specifies the value of the affiliate_id field.';
                }
                field(privacy_optout; Rec.privacy_optout)
                {
                    ToolTip = 'Specifies the value of the privacy_optout field.';
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(updated_at; Rec.updated_at)
                {
                    ToolTip = 'Specifies the value of the updated_at field.';
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
                    AccessTokenMgtCULcl.GetAccountData();
                end;
            }
        }
    }
}

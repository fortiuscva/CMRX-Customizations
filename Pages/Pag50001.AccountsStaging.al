page 50001 "CRX Accounts Staging"
{
    ApplicationArea = All;
    Caption = 'Accounts Staging';
    PageType = List;
    SourceTable = "CRX Accounts Staging";
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
                field(first_name; Rec.first_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the first_name field.';
                }
                field(last_name; Rec.last_name)
                {
                    ToolTip = 'Specifies the value of the last_name field.';
                }
                field(email; Rec.email)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the email field.';
                }
                field(phone; Rec.phone)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the phone field.';
                }
                field(group_id; Rec.group_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the group_id field.';
                }
                field(zip; Rec.zip)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the zip field.';
                }
                field(sex; Rec.sex)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the sex field.';
                }
                field(ethnicity; Rec.ethnicity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ethnicity field.';
                }
                field(age_range; Rec.age_range)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the age_range field.';
                }
                field(affiliate_id; Rec.affiliate_id)
                {
                    ToolTip = 'Specifies the value of the affiliate_id field.';
                }
                field(privacy_optout; Rec.privacy_optout)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the privacy_optout field.';
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
                    AccessTokenMgtCULcl.GetAccountData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;


                trigger OnAction()
                var
                    AccountsStaging: Record "CRX Accounts Staging";
                    ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(AccountsStaging);
                    ProcessStagingDataaCULcl.ProcessAccountStaging(AccountsStaging);
                end;
            }
        }
    }
}

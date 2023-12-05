page 50001 "CRX Accounts Staging"
{
    ApplicationArea = All;
    Caption = 'Accounts Staging';
    PageType = List;
    SourceTable = "CRX Accounts Staging";
    UsageCategory = Lists;
    DeleteAllowed = false;
    InsertAllowed = false;

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
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the id field.';
                    Editable = false;
                }
                field(first_name; Rec.first_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the first_name field.';
                    Editable = false;
                }
                field(last_name; Rec.last_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the last_name field.';
                    Editable = false;
                }
                field(email; Rec.email)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the email field.';
                    Editable = false;
                }
                field(phone; Rec.phone)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the phone field.';
                    Editable = false;
                }
                field(group_id; Rec.group_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the group_id field.';
                    Editable = false;
                }
                field(zip; Rec.zip)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the zip field.';
                    Editable = false;
                }
                field(sex; Rec.sex)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the sex field.';
                    Editable = false;
                }
                field(ethnicity; Rec.ethnicity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ethnicity field.';
                    Editable = false;
                }
                field(age_range; Rec.age_range)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the age_range field.';
                    Editable = false;
                }
                field(affiliate_id; Rec.affiliate_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the affiliate_id field.';
                    Editable = false;
                }
                field(privacy_optout; Rec.privacy_optout)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the privacy_optout field.';
                    Editable = false;
                }
                field(created_at; Rec.created_at)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the created_at field.';
                    Editable = false;
                }
                field(updated_at; Rec.updated_at)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the updated_at field.';
                    Editable = false;
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
                    AccessTokenMgtCULcl.GetAccountData();
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

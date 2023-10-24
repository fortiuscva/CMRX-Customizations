page 50004 "CRX Usages Staging"
{
    ApplicationArea = All;
    Caption = 'Usages Staging';
    PageType = List;
    SourceTable = "CRX Usages Staging";
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
                field(account_id; Rec.account_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the account_id field.';
                }
                field(provider; Rec.provider)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the provider field.';
                }
                field(bin; Rec.bin)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the bin field.';
                }
                field(npi; Rec.npi)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the npi field.';
                }
                field(brand; Rec.brand)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the brand field.';
                }
                field(ndc; Rec.ndc)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ndc field.';
                }
                field(drug_name; Rec.drug_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the drug_name field.';
                }
                field(Dosage; Rec.Dosage)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Dosage field.';
                }
                field(extra; Rec.extra)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the extra field.';
                }
                field(price; Rec.price)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the price field.';
                }
                field(quantity; Rec.quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the quantity field.';
                }
                field(created_at; Rec.created_at)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(member_id; Rec.member_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the member_id field.';
                }
                field(group_id; Rec.group_id)
                {
                    ToolTip = 'Specifies the value of the group_id field.';
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
                field(age_range; Rec.age_range)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the age_range field.';
                }
                field(ethnicity; Rec.ethnicity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ethnicity field.';
                }
                field(sex; Rec.sex)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the sex field.';
                }
                field(first_name; Rec.first_name)
                {
                    ToolTip = 'Specifies the value of the first_name field.';
                }
                field(last_name; Rec.last_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the last_name field.';
                }
                field(account_zip; Rec.account_zip)
                {
                    ToolTip = 'Specifies the value of the account_zip field.';
                }
                field(group_name; Rec.group_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the group_name field.';
                }
                field(peo_company; Rec.peo_company)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_company field.';
                }
                field(peo_id; Rec.peo_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_id field.';
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
                    AccessTokenMgtCULcl.GetUsagesData();
                end;
            }
            action("Process Data")
            {
                ApplicationArea = all;


                trigger OnAction()
                var
                    UsagesStaging: Record "CRX Usages Staging";
                    ProcessStagingDataaCULcl: Codeunit "CRX Process Staging Data";
                begin
                    CurrPage.SetSelectionFilter(UsagesStaging);
                    ProcessStagingDataaCULcl.ProcessUsagesStaging(UsagesStaging);
                end;
            }
        }
    }
}

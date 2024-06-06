page 50023 "CRX Claim Staging"
{
    ApplicationArea = All;
    Caption = 'Claim Staging';
    PageType = List;
    SourceTable = "CRX Claim Staging";
    UsageCategory = Lists;
    //DeleteAllowed = false;
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
                field(account_id; Rec.account_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the account_id field.';
                    Editable = false;
                }
                field(provider; Rec.provider)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the provider field.';
                    Editable = false;
                }
                field(bin; Rec.bin)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the bin field.';
                    Editable = false;
                }
                field(npi; Rec.npi)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the npi field.';
                    Editable = false;
                }
                field(brand; Rec.brand)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the brand field.';
                    Editable = false;
                }
                field(ndc; Rec.ndc)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ndc field.';
                    Editable = false;
                }
                field(drug_name; Rec.drug_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the drug_name field.';
                    Editable = false;
                }
                field(Dosage; Rec.Dosage)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Dosage field.';
                    Editable = false;
                }
                field(extra; Rec.extra)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the extra field.';
                    Editable = false;
                }
                field(price; Rec.price)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the price field.';
                    Editable = false;
                }
                field(quantity; Rec.quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the quantity field.';
                    Editable = false;
                }
                field(created_at; Rec.created_at)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the created_at field.';
                    Editable = false;
                }
                field(member_id; Rec.member_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the member_id field.';
                    Editable = false;
                }
                field(group_id; Rec.group_id)
                {
                    ToolTip = 'Specifies the value of the group_id field.';
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
                field(age_range; Rec.age_range)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the age_range field.';
                    Editable = false;
                }
                field(ethnicity; Rec.ethnicity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ethnicity field.';
                    Editable = false;
                }
                field(sex; Rec.sex)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the sex field.';
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
                field(account_zip; Rec.account_zip)
                {
                    ToolTip = 'Specifies the value of the account_zip field.';
                    Editable = false;
                }
                field(group_name; Rec.group_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the group_name field.';
                    Editable = false;
                }
                field(peo_company; Rec.peo_company)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_company field.';
                    Editable = false;
                }
                field(peo_id; Rec.peo_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_id field.';
                    Editable = false;
                }
                field(Submitted_at; Rec.Submitted_at)
                {
                    ToolTip = 'Specifies the value of the Submitted_at field.';
                }
                field(Fee; rec."Fee ($)")
                {
                    ToolTip = 'Specifies the value of the Fee';
                }
                field(total; rec.total)
                {
                    ApplicationArea = all;
                    ToolTip = 'Total No. of lines received in the Response';
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
                    AccessTokenMgtCULcl.GetClaimData();
                end;
            }
        }
    }
}

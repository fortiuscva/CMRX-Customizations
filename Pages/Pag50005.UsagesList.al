page 50005 "CRX Usages List"
{
    ApplicationArea = All;
    Caption = 'Usages List';
    PageType = List;
    SourceTable = "CRX Usages Staging";
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
                field(account_id; Rec.account_id)
                {
                    ToolTip = 'Specifies the value of the account_id field.';
                }
                field(provider; Rec.provider)
                {
                    ToolTip = 'Specifies the value of the provider field.';
                }
                field(bin; Rec.bin)
                {
                    ToolTip = 'Specifies the value of the bin field.';
                }
                field(npi; Rec.npi)
                {
                    ToolTip = 'Specifies the value of the npi field.';
                }
                field(brand; Rec.brand)
                {
                    ToolTip = 'Specifies the value of the brand field.';
                }
                field(ndc; Rec.ndc)
                {
                    ToolTip = 'Specifies the value of the ndc field.';
                }
                field(drug_name; Rec.drug_name)
                {
                    ToolTip = 'Specifies the value of the drug_name field.';
                }
                field(extra; Rec.extra)
                {
                    ToolTip = 'Specifies the value of the extra field.';
                }
                field(price; Rec.price)
                {
                    ToolTip = 'Specifies the value of the price field.';
                }
                field(quantity; Rec.quantity)
                {
                    ToolTip = 'Specifies the value of the quantity field.';
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field.';
                }
                field(member_id; Rec.member_id)
                {
                    ToolTip = 'Specifies the value of the member_id field.';
                }
                field(group_id; Rec.group_id)
                {
                    ToolTip = 'Specifies the value of the group_id field.';
                }
                field(email; Rec.email)
                {
                    ToolTip = 'Specifies the value of the email field.';
                }
                field(phone; Rec.phone)
                {
                    ToolTip = 'Specifies the value of the phone field.';
                }
                field(age_range; Rec.age_range)
                {
                    ToolTip = 'Specifies the value of the age_range field.';
                }
                field(ethnicity; Rec.ethnicity)
                {
                    ToolTip = 'Specifies the value of the ethnicity field.';
                }
                field(sex; Rec.sex)
                {
                    ToolTip = 'Specifies the value of the sex field.';
                }
                field(first_name; Rec.first_name)
                {
                    ToolTip = 'Specifies the value of the first_name field.';
                }
                field(last_name; Rec.last_name)
                {
                    ToolTip = 'Specifies the value of the last_name field.';
                }
                field(account_zip; Rec.account_zip)
                {
                    ToolTip = 'Specifies the value of the account_zip field.';
                }
                field(group_name; Rec.group_name)
                {
                    ToolTip = 'Specifies the value of the group_name field.';
                }
                field(peo_company; Rec.peo_company)
                {
                    ToolTip = 'Specifies the value of the peo_company field.';
                }
                field(peo_id; Rec.peo_id)
                {
                    ToolTip = 'Specifies the value of the peo_id field.';
                }
                field(privacy_optout; Rec.privacy_optout)
                {
                    ToolTip = 'Specifies the value of the privacy_optout field.';
                }
                field(Dosage; Rec.Dosage)
                {
                    ToolTip = 'Specifies the value of the Dosage field.';
                }
                field(total; Rec.total)
                {
                    ToolTip = 'Total No. of lines received in the Response';
                }
                field(broker_company; Rec.broker_company)
                {
                    ToolTip = 'Specifies the value of the broker_company field.';
                }
                field(broker_id; Rec.broker_id)
                {
                    ToolTip = 'Specifies the value of the broker_id field.';
                }
            }
        }
    }
}

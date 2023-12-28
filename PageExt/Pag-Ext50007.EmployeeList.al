pageextension 50007 "CRX Employee List" extends "Employee List"
{
    layout
    {
        addlast(Control1)
        {
            field("CRX Group Id"; rec."CRX Group Id")
            {
                ApplicationArea = all;
            }
            field("CRX Ethnicity"; rec."CRX Ethnicity")
            {
                ApplicationArea = all;
            }
            field("CRX Age_range"; rec."CRX Age_range")
            {
                ApplicationArea = all;
            }
            field("CRX Usages"; rec."CRX Usages")
            {
                ApplicationArea = all;
            }
            field("CRX Affiliate Id"; rec."CRX Affiliate Id")
            {
                ApplicationArea = all;
            }
        }
    }
}
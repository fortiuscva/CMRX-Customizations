pageextension 50001 "CRX Employee Card" extends "Employee Card"
{
    layout
    {
        addlast(General)
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
        }
    }
}

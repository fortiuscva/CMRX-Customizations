page 50006 "CRX Contact Staging"
{
    ApplicationArea = All;
    Caption = 'Contact Staging';
    PageType = List;
    SourceTable = "CRX Contact Staging";
    UsageCategory = Lists;

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
                }
                field(id; Rec.id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(name; Rec.name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the name field.';
                }
                field(note; Rec.note)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the note field.';
                }
                field(phone; Rec.phone)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the phone field.';
                }
                field(email; Rec.email)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the email field.';
                }
                field(salesman_id; Rec.salesman_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the salesman_id field.';
                }
                field(broker_id; Rec.broker_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the broker_id field.';
                }
                field(group_ids; Rec.group_ids)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the group_ids field.';
                }
                field(peo_ids; Rec.peo_ids)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_ids field.';
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
                    AccessTokenMgtCULcl.GetContactData();
                end;
            }
        }
    }
}

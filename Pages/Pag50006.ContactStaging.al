page 50006 "CRX Contact Staging"
{
    ApplicationArea = All;
    Caption = 'Contact Staging';
    PageType = List;
    SourceTable = "CRX Contact Staging";
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
                field(name; Rec.name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the name field.';
                    Editable = false;
                }
                field(note; Rec.note)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the note field.';
                    Editable = false;
                }
                field(phone; Rec.phone)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the phone field.';
                    Editable = false;
                }
                field(email; Rec.email)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the email field.';
                    Editable = false;
                }
                field(salesman_id; Rec.salesman_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the salesman_id field.';
                    Editable = false;
                }
                field(broker_id; Rec.broker_id)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the broker_id field.';
                    Editable = false;
                }
                field(group_ids; Rec.group_ids)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the group_ids field.';
                    Editable = false;
                }
                field(peo_ids; Rec.peo_ids)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the peo_ids field.';
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
                    AccessTokenMgtCULcl.GetContactData();
                end;
            }
        }
    }
}

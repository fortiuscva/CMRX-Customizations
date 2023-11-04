page 50015 "CRX Usuages List"
{
    ApplicationArea = All;
    Caption = 'Usuages List';
    PageType = List;
    SourceTable = "CRX Usages";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Rec; Rec."Employee Id")
                {
                    ApplicationArea = all;
                }
                field(Bin; Bin)
                {
                    ApplicationArea = all;
                }
                field(Npi; Npi)
                {
                    ApplicationArea = all;
                }
                field(Price; Price)
                {
                    ApplicationArea = all;
                }
                field(Ndc; Ndc)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

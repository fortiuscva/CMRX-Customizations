page 50017 "Discount Card Reconcillation"
{
    ApplicationArea = All;
    Caption = 'Discount Card Reconcillation';
    PageType = Worksheet;
    SourceTable = "CRX Discount Card Data";
    UsageCategory = Tasks;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            field("Bin Filter"; BinFilterVarGbl)
            {
                ApplicationArea = all;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    if BinFilterVarGbl <> '' then
                        Rec.SetFilter(BIN, BinFilterVarGbl)
                    else
                        rec.SetRange(BIN);
                    if NPIFilterVarGbl <> '' then
                        Rec.SetFilter("Prescriber NPI", NPIFilterVarGbl)
                    else
                        rec.SetRange("Prescriber NPI");
                    if NDCFilterVarGbl <> '' then
                        Rec.SetFilter(NDC, NDCFilterVarGbl)
                    else
                        Rec.SetRange(NDC);
                    Rec.SetRange("Record Status", RecordStatusVarGbl);
                    CurrPage.Update(false);

                end;
            }
            field("NPI Filter"; NPIFilterVarGbl)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    if BinFilterVarGbl <> '' then
                        Rec.SetFilter(BIN, BinFilterVarGbl)
                    else
                        rec.SetRange(BIN);
                    if NPIFilterVarGbl <> '' then
                        Rec.SetFilter("Prescriber NPI", NPIFilterVarGbl)
                    else
                        rec.SetRange("Prescriber NPI");
                    if NDCFilterVarGbl <> '' then
                        Rec.SetFilter(NDC, NDCFilterVarGbl)
                    else
                        Rec.SetRange(NDC);
                    Rec.SetRange("Record Status", RecordStatusVarGbl);
                    CurrPage.Update(false);
                end;
            }
            field("NDC Filter"; NDCFilterVarGbl)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    if BinFilterVarGbl <> '' then
                        Rec.SetFilter(BIN, BinFilterVarGbl)
                    else
                        rec.SetRange(BIN);
                    if NPIFilterVarGbl <> '' then
                        Rec.SetFilter("Prescriber NPI", NPIFilterVarGbl)
                    else
                        rec.SetRange("Prescriber NPI");
                    if NDCFilterVarGbl <> '' then
                        Rec.SetFilter(NDC, NDCFilterVarGbl)
                    else
                        Rec.SetRange(NDC);
                    Rec.SetRange("Record Status", RecordStatusVarGbl);
                    CurrPage.Update(false);
                end;
            }
            field("Record Status Filter"; RecordStatusVarGbl)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    if BinFilterVarGbl <> '' then
                        Rec.SetFilter(BIN, BinFilterVarGbl)
                    else
                        rec.SetRange(BIN);
                    if NPIFilterVarGbl <> '' then
                        Rec.SetFilter("Prescriber NPI", NPIFilterVarGbl)
                    else
                        rec.SetRange("Prescriber NPI");
                    if NDCFilterVarGbl <> '' then
                        Rec.SetFilter(NDC, NDCFilterVarGbl)
                    else
                        Rec.SetRange(NDC);
                    Rec.SetRange("Record Status", RecordStatusVarGbl);
                    CurrPage.Update(false);
                end;
            }

            repeater(General)
            {
                Editable = false;
                field(BIN; Rec.BIN)
                {
                    ToolTip = 'Specifies the value of the BIN field.';
                }
                field("DATE Submitted"; Rec."DATE Submitted")
                {
                    ToolTip = 'Specifies the value of the DATE Submitted field.';
                }
                field("Prescriber NPI"; Rec."Prescriber NPI")
                {
                    ToolTip = 'Specifies the value of the Prescriber NPI field.';
                }
                field(NDC; Rec.NDC)
                {
                    ToolTip = 'Specifies the value of the NDC field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field("Record Status"; Rec."Record Status")
                {
                    ToolTip = 'Specifies the value of the Record Status field.';
                }
            }
        }
        area(factboxes)
        {
            part("Discount Card Compare Data"; "CRX Discount Card Compare Data")
            {
                ApplicationArea = all;
                SubPageLink = "Discount Card Entry No." = FIELD("Entry No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportData)
            {
                ApplicationArea = all;
                Caption = 'Import Data';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Import;

                trigger OnAction()
                var
                    ImportDiscountCardXmlportLcl: XmlPort "CRX Import Discount Card Data";
                begin
                    ImportDiscountCardXmlportLcl.Run();
                end;
            }
            action(Compare)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                Image = Process;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DiscountCardDataRecLcl: Record "CRX Discount Card Data";
                    UsagesStagingRecLcl: Record "CRX Usages Staging";
                    DiscountCardCompareRecLcl: Record "CRX Discount Card Compare Data";
                begin
                    DiscountCardDataRecLcl.Reset();
                    if BinFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter(BIN, BinFilterVarGbl);
                    if NPIFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter("Prescriber NPI", NPIFilterVarGbl);
                    if NDCFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter(NDC, NDCFilterVarGbl);
                    if RecordStatusVarGbl <> RecordStatusVarGbl::" " then
                        DiscountCardDataRecLcl.SetRange("Record Status", RecordStatusVarGbl);
                    if DiscountCardDataRecLcl.FindSet() then
                        repeat
                            DiscountCardCompareRecLcl.Reset();
                            DiscountCardCompareRecLcl.SetRange("Discount Card Entry No.", DiscountCardDataRecLcl."Entry No.");
                            if DiscountCardCompareRecLcl.FindSet() then
                                DiscountCardCompareRecLcl.DeleteAll();

                            UsagesStagingRecLcl.Reset();
                            UsagesStagingRecLcl.SetRange(bin, DiscountCardDataRecLcl.BIN);
                            UsagesStagingRecLcl.SetRange(npi, DiscountCardDataRecLcl."Prescriber NPI");
                            UsagesStagingRecLcl.SetRange(ndc, DiscountCardDataRecLcl.NDC);
                            if UsagesStagingRecLcl.FindFirst() then begin
                                if (UsagesStagingRecLcl.quantity <> DiscountCardDataRecLcl.Quantity) or (UsagesStagingRecLcl.price <> DiscountCardDataRecLcl.Price) then begin
                                    if UsagesStagingRecLcl.quantity <> DiscountCardDataRecLcl.Quantity then begin
                                        DiscountCardCompareRecLcl.Init();
                                        DiscountCardCompareRecLcl."Discount Card Entry No." := DiscountCardDataRecLcl."Entry No.";
                                        DiscountCardCompareRecLcl.Comment := 'Quantity of Discount does not Match.';
                                        DiscountCardCompareRecLcl.Insert(true);

                                        DiscountCardDataRecLcl."Record Status" := DiscountCardDataRecLcl."Record Status"::Unmatched;
                                        DiscountCardDataRecLcl.Modify();
                                    end;
                                    if UsagesStagingRecLcl.price <> DiscountCardDataRecLcl.Price then begin
                                        DiscountCardCompareRecLcl.Init();
                                        DiscountCardCompareRecLcl."Discount Card Entry No." := DiscountCardDataRecLcl."Entry No.";
                                        DiscountCardCompareRecLcl.Comment := 'Price of Discount does not Match.';
                                        DiscountCardCompareRecLcl.Insert(true);

                                        DiscountCardDataRecLcl."Record Status" := DiscountCardDataRecLcl."Record Status"::Unmatched;
                                        DiscountCardDataRecLcl.Modify();
                                    end;
                                end else begin
                                    DiscountCardDataRecLcl."Record Status" := DiscountCardDataRecLcl."Record Status"::Matched;
                                    DiscountCardDataRecLcl.Modify();
                                end;
                            end else begin
                                DiscountCardCompareRecLcl.Init();
                                DiscountCardCompareRecLcl."Discount Card Entry No." := DiscountCardDataRecLcl."Entry No.";
                                DiscountCardCompareRecLcl.Comment := 'Record does not exist.';
                                DiscountCardCompareRecLcl.Insert(true);

                                DiscountCardDataRecLcl."Record Status" := DiscountCardDataRecLcl."Record Status"::Unmatched;
                                DiscountCardDataRecLcl.Modify();
                            end;
                        until DiscountCardDataRecLcl.Next() = 0;
                    Message('Record Compared successfully.');
                end;
            }
        }
    }
    var
        BinFilterVarGbl: Text;
        NPIFilterVarGbl: Text;
        NDCFilterVarGbl: Text;
        RecordStatusVarGbl: Enum "CRX Record Status";
}

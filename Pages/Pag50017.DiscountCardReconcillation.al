page 50017 "Discount Card Reconcillation"
{
    ApplicationArea = All;
    Caption = 'Discount Card Data Reconcillation';
    PageType = Worksheet;
    SourceTable = "CRX Discount Card Data";
    UsageCategory = Tasks;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(Options)
            {
                Caption = 'Options';
                field("Bin Filter"; BinFilterVarGbl)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        ValidateFilters();
                    end;
                }
                field("NPI Filter"; NPIFilterVarGbl)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        ValidateFilters();
                    end;
                }
                field("NDC Filter"; NDCFilterVarGbl)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        ValidateFilters();
                    end;
                }
            }

            group(Details)
            {
                Caption = '';
                field("Date Filter"; DateFilterVarGbl)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        ValidateFilters();
                    end;
                }
                field("Show Details"; RecordStatusVarGbl)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        ValidateFilters();
                    end;
                }
            }
            repeater(General)
            {
                Editable = false;
                field(BIN; Rec.BIN)
                {
                    ToolTip = 'Specifies the value of the BIN field.';
                    StyleExpr = StyleTxt;
                }
                field("DATE Submitted"; Rec."DATE Submitted")
                {
                    ToolTip = 'Specifies the value of the DATE Submitted field.';
                    StyleExpr = StyleTxt;
                }
                field("Prescriber NPI"; Rec."Prescriber NPI")
                {
                    ToolTip = 'Specifies the value of the Prescriber NPI field.';
                    StyleExpr = StyleTxt;
                }
                field(NDC; Rec.NDC)
                {
                    ToolTip = 'Specifies the value of the NDC field.';
                    StyleExpr = StyleTxt;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    StyleExpr = StyleTxt;
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                    StyleExpr = StyleTxt;
                }
                field("Compare Status"; Rec."Compare Status")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Compare Status field.';
                    StyleExpr = StyleTxt;
                }
                field("Import DateTime"; Rec."Import DateTime")
                {
                    ToolTip = 'Specifies the value of the Import DateTime field.';
                    StyleExpr = StyleTxt;
                }
                field("Compare DateTime"; Rec."Compare DateTime")
                {
                    ToolTip = 'Specifies the value of the Compare DteTime field.';
                    StyleExpr = StyleTxt;
                }
            }
            part(Usages; "CRX Usages SubForm")
            {
                Editable = false;
                ApplicationArea = all;
                SubPageLink = Bin = field(BIN), Npi = field("Prescriber NPI"), Ndc = field(NDC);
                UpdatePropagation = Both;
                Caption = 'Usages';
            }
        }
        area(factboxes)
        {
            part("Error Details"; "CRX Error Details")
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
                    Customerledg: Page "Customer Ledger Entries";
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
                    ErrorDetailsRecLcl: Record "CRX Error Details";
                    DateFilterErrorLbl: Label 'Please Input the Date Filter';
                begin
                    if DateFilterVarGbl = '' then
                        error(DateFilterErrorLbl);

                    DiscountCardDataRecLcl.Reset();
                    if BinFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter(BIN, BinFilterVarGbl);
                    if NPIFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter("Prescriber NPI", NPIFilterVarGbl);
                    if NDCFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter(NDC, NDCFilterVarGbl);
                    if RecordStatusVarGbl <> RecordStatusVarGbl::" " then
                        DiscountCardDataRecLcl.SetRange("Compare Status", RecordStatusVarGbl);
                    if DateFilterVarGbl <> '' then
                        DiscountCardDataRecLcl.SetFilter("DATE Submitted", DateFilterVarGbl);
                    if DiscountCardDataRecLcl.FindSet() then
                        repeat
                            ErrorDetailsRecLcl.Reset();
                            ErrorDetailsRecLcl.SetRange("Discount Card Entry No.", DiscountCardDataRecLcl."Entry No.");
                            if ErrorDetailsRecLcl.FindSet() then
                                ErrorDetailsRecLcl.DeleteAll();

                            UsagesStagingRecLcl.Reset();
                            UsagesStagingRecLcl.SetRange(bin, DiscountCardDataRecLcl.BIN);
                            UsagesStagingRecLcl.SetRange(npi, DiscountCardDataRecLcl."Prescriber NPI");
                            UsagesStagingRecLcl.SetRange(ndc, DiscountCardDataRecLcl.NDC);
                            if UsagesStagingRecLcl.FindFirst() then begin
                                if (UsagesStagingRecLcl.quantity <> DiscountCardDataRecLcl.Quantity) or (UsagesStagingRecLcl.price <> DiscountCardDataRecLcl.Price) then begin
                                    if UsagesStagingRecLcl.quantity <> DiscountCardDataRecLcl.Quantity then begin
                                        ErrorDetailsRecLcl.Init();
                                        ErrorDetailsRecLcl."Discount Card Entry No." := DiscountCardDataRecLcl."Entry No.";
                                        ErrorDetailsRecLcl.Comment := 'Quantity not matched';
                                        ErrorDetailsRecLcl.Insert(true);

                                        DiscountCardDataRecLcl."Compare Status" := DiscountCardDataRecLcl."Compare Status"::Unmatched;
                                        DiscountCardDataRecLcl.Modify();
                                    end;
                                    if UsagesStagingRecLcl.price <> DiscountCardDataRecLcl.Price then begin
                                        ErrorDetailsRecLcl.Init();
                                        ErrorDetailsRecLcl."Discount Card Entry No." := DiscountCardDataRecLcl."Entry No.";
                                        ErrorDetailsRecLcl.Comment := 'Price not matched';
                                        ErrorDetailsRecLcl.Insert(true);

                                        DiscountCardDataRecLcl."Compare Status" := DiscountCardDataRecLcl."Compare Status"::Unmatched;
                                        DiscountCardDataRecLcl."Compare DateTime" := CurrentDateTime();
                                        DiscountCardDataRecLcl.Modify();
                                    end;
                                end else begin
                                    DiscountCardDataRecLcl."Compare Status" := DiscountCardDataRecLcl."Compare Status"::Matched;
                                    DiscountCardDataRecLcl."Compare DateTime" := CurrentDateTime();
                                    DiscountCardDataRecLcl.Modify();
                                end;
                            end else begin
                                ErrorDetailsRecLcl.Init();
                                ErrorDetailsRecLcl."Discount Card Entry No." := DiscountCardDataRecLcl."Entry No.";
                                ErrorDetailsRecLcl.Comment := 'Record not exist.';
                                ErrorDetailsRecLcl.Insert(true);

                                DiscountCardDataRecLcl."Compare Status" := DiscountCardDataRecLcl."Compare Status"::Unmatched;
                                DiscountCardDataRecLcl."Compare DateTime" := CurrentDateTime();
                                DiscountCardDataRecLcl.Modify();
                            end;
                        until DiscountCardDataRecLcl.Next() = 0;
                    Message('Records Processed successfully.');
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        StyleTxt := SetStyle();
    end;

    var
        BinFilterVarGbl: Text;
        NPIFilterVarGbl: Text;
        NDCFilterVarGbl: Text;
        DateFilterVarGbl: Text;
        StyleTxt: Text;
        RecordStatusVarGbl: Enum "CRX Show Details";

    procedure ValidateFilters()
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
        if RecordStatusVarGbl <> RecordStatusVarGbl::" " then
            Rec.SetRange("Compare Status", RecordStatusVarGbl)
        else
            rec.SetRange("Compare Status");
        if DateFilterVarGbl <> '' then
            Rec.SetFilter("DATE Submitted", DateFilterVarGbl)
        else
            Rec.SetRange("DATE Submitted");

        CurrPage.Update(false);
    end;

    procedure SetStyle() Style: Text
    var
        IsHandled: Boolean;
    begin
        if rec."Compare Status" <> rec."Compare Status"::Unmatched then
            exit('None')
        else
            exit('Attention');
    end;
}

xmlport 50000 "CRX Import Discount Card Data"
{
    Caption = 'Import Discount Card Data';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(CRXDiscountCardData; "CRX Discount Card Data")
            {
                SourceTableView = sorting("Entry No.");
                fieldelement(BIN; CRXDiscountCardData.BIN)
                {
                }
                fieldelement(DATESubmitted; CRXDiscountCardData."DATE Submitted")
                {
                }
                fieldelement(PrescriberNPI; CRXDiscountCardData."Prescriber NPI")
                {
                }
                fieldelement(NDC; CRXDiscountCardData.NDC)
                {
                }
                fieldelement(Quantity; CRXDiscountCardData.Quantity)
                {
                }
                fieldelement(Price; CRXDiscountCardData.Price)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    NoofRecordsVarGbl += 1;
                end;
            }
        }
    }

    trigger OnPostXmlPort()
    begin
        if NoofRecordsVarGbl <> 0 then
            Message('%1 Records import Successfully.', NoofRecordsVarGbl);
    end;

    var
        NoofRecordsVarGbl: Integer;
}

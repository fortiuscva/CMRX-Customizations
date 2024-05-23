codeunit 50011 "CRX DistributorStaging"
{
    TableNo = "CRX Distributors Staging";

    trigger OnRun()
    var
        VendorRecLcl: Record Vendor;
        GroupVendorRecLcl: Record Vendor;
        SalesPersonRecLcl: Record "Salesperson/Purchaser";
    begin
        VendorRecLcl.Init();
        VendorRecLcl.Validate("No.", Rec.id);
        VendorRecLcl.Name := rec.name;
        VendorRecLcl."E-Mail" := rec.email;
        VendorRecLcl.Contact := rec.contact_name;
        VendorRecLcl.Validate("Vendor Posting Group", 'DOMESTIC');
        VendorRecLcl.Validate("Gen. Bus. Posting Group", 'DOMESTIC');

        SalesPersonRecLcl.Reset();
        SalesPersonRecLcl.SetRange("CRX Main_Distributor_ID", rec.id);
        if SalesPersonRecLcl.FindFirst() then
            VendorRecLcl.validate("Purchaser Code", SalesPersonRecLcl.Code);

        if not VendorRecLcl.Insert() then
            VendorRecLcl.Modify();
    end;
}

codeunit 50000 "CRX Access Token Management"
{
    trigger OnRun()
    begin
        FetchAllAPIData();
    end;

    procedure GetAccountData()
    var
        AccountStagingRecLcl: Record "CRX Accounts Staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        AcccountDetailsTxt: Text;
        AccountJsonText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Accounts Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Accounts Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Accounts Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Accounts Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('accounts', AccountJsonText) then begin
                //AccountJsonText := '[' + AccountJsonText + ']';

                ArrayJsonMgt.InitializeCollection(AccountJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(AcccountDetailsTxt, i);
                    JsonMgt.InitializeObject(AcccountDetailsTxt);
                    AccountStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', AccountStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('first_name', AccountStagingRecLcl.first_name);
                    JsonMgt.GetStringPropertyValueByName('last_name', AccountStagingRecLcl.last_name);
                    JsonMgt.GetStringPropertyValueByName('email', AccountStagingRecLcl.email);
                    JsonMgt.GetStringPropertyValueByName('phone', AccountStagingRecLcl.phone);
                    JsonMgt.GetStringPropertyValueByName('group_id', AccountStagingRecLcl.group_id);
                    JsonMgt.GetStringPropertyValueByName('zip', AccountStagingRecLcl.zip);
                    JsonMgt.GetStringPropertyValueByName('sex', AccountStagingRecLcl.sex);
                    JsonMgt.GetStringPropertyValueByName('ethnicity', AccountStagingRecLcl.ethnicity);
                    JsonMgt.GetStringPropertyValueByName('age_range', AccountStagingRecLcl.age_range);
                    JsonMgt.GetStringPropertyValueByName('affiliate_id', AccountStagingRecLcl.affiliate_id);
                    JsonMgt.GetStringPropertyValueByName('privacy_optout', AccountStagingRecLcl.privacy_optout);
                    JsonMgt.GetStringPropertyValueByName('created_at', AccountStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', AccountStagingRecLcl.updated_at);
                    AccountStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Accounts Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    procedure GetGroupData()
    var
        GroupStagingRecLcl: Record "CRX Groups Staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        GroupDetailsTxt: Text;
        GroupJsonText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Group Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Group Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Group Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Group Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('groups', GroupJsonText) then begin
                //GroupJsonText := '[' + GroupJsonText + ']';

                ArrayJsonMgt.InitializeCollection(GroupJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(GroupDetailsTxt, i);
                    JsonMgt.InitializeObject(GroupDetailsTxt);
                    GroupStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', GroupStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('name', GroupStagingRecLcl.name);
                    JsonMgt.GetStringPropertyValueByName('peo_id', GroupStagingRecLcl.peo_id);
                    JsonMgt.GetStringPropertyValueByName('broker_id', GroupStagingRecLcl.broker_id);
                    JsonMgt.GetStringPropertyValueByName('salesman_id', GroupStagingRecLcl.salesman_id);
                    JsonMgt.GetStringPropertyValueByName('created_at', GroupStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', GroupStagingRecLcl.updated_at);
                    //JsonMgt.GetStringPropertyValueByName('contacts', GroupStagingRecLcl.contacts);
                    GroupStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Group Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    procedure GetPeosData()
    var
        PeosStagingRecLcl: Record "CRX peos staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        PeosDetailsTxt: Text;
        PeosJsonText: Text;
        PeosTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Peos Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Peos Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Peos Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Peos Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin


            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('peos', PeosJsonText) then begin
                // PeosJsonText := '[' + PeosJsonText + ']';

                ArrayJsonMgt.InitializeCollection(PeosJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(PeosDetailsTxt, i);
                    JsonMgt.InitializeObject(PeosDetailsTxt);
                    PeosStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', PeosStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('company', PeosStagingRecLcl.company);
                    JsonMgt.GetStringPropertyValueByName('created_at', PeosStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', PeosStagingRecLcl.updated_at);
                    //JsonMgt.GetStringPropertyValueByName('contacts', PeosStagingRecLcl.contacts);

                    TotalJsonMgt.InitializeObject(ResponseTextVarLcl);

                    IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', PeosTotalText) then
                        TotalJsonMgt.GetStringPropertyValueByName('total', PeosStagingRecLcl.total);
                    PeosStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Peos Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    procedure GetUsagesData()
    var
        UsagesStagingRecLcl: Record "CRX Usages Staging";
        UsageidVarLcl: text[250];
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        UsageDetailsTxt: Text;
        UsageJsonText: Text;
        UsageTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Usages Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Usages Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Usages Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Usages Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('usages', UsageJsonText) then begin

                ArrayJsonMgt.InitializeCollection(UsageJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(UsageDetailsTxt, i);
                    JsonMgt.InitializeObject(UsageDetailsTxt);

                    Clear(UsageidVarLcl);
                    JsonMgt.GetStringPropertyValueByName('id', UsageidVarLcl);
                    UsagesStagingRecLcl.Reset();
                    UsagesStagingRecLcl.SetRange(id, UsageidVarLcl);
                    if not UsagesStagingRecLcl.FindFirst() then begin
                        UsagesStagingRecLcl.Init();
                        JsonMgt.GetStringPropertyValueByName('id', UsagesStagingRecLcl.id);
                        JsonMgt.GetStringPropertyValueByName('account_id', UsagesStagingRecLcl.account_id);
                        JsonMgt.GetStringPropertyValueByName('provider', UsagesStagingRecLcl.provider);
                        JsonMgt.GetStringPropertyValueByName('bin', UsagesStagingRecLcl.bin);
                        JsonMgt.GetStringPropertyValueByName('npi', UsagesStagingRecLcl.npi);
                        JsonMgt.GetStringPropertyValueByName('brand', UsagesStagingRecLcl.brand);
                        JsonMgt.GetStringPropertyValueByName('ndc', UsagesStagingRecLcl.ndc);
                        JsonMgt.GetStringPropertyValueByName('drug_name', UsagesStagingRecLcl.drug_name);
                        JsonMgt.GetStringPropertyValueByName('dosage', UsagesStagingRecLcl.dosage);
                        JsonMgt.GetStringPropertyValueByName('extra', UsagesStagingRecLcl.extra);
                        JsonMgt.GetStringPropertyValueByName('price', UsagesStagingRecLcl.price);
                        JsonMgt.GetStringPropertyValueByName('quantity', UsagesStagingRecLcl.quantity);
                        JsonMgt.GetStringPropertyValueByName('created_at', UsagesStagingRecLcl.created_at);
                        JsonMgt.GetStringPropertyValueByName('member_id', UsagesStagingRecLcl.member_id);
                        JsonMgt.GetStringPropertyValueByName('group_id', UsagesStagingRecLcl.group_id);
                        JsonMgt.GetStringPropertyValueByName('email', UsagesStagingRecLcl.email);
                        JsonMgt.GetStringPropertyValueByName('phone', UsagesStagingRecLcl.phone);
                        JsonMgt.GetStringPropertyValueByName('age_range', UsagesStagingRecLcl.age_range);
                        JsonMgt.GetStringPropertyValueByName('ethnicity', UsagesStagingRecLcl.ethnicity);
                        JsonMgt.GetStringPropertyValueByName('sex', UsagesStagingRecLcl.sex);
                        JsonMgt.GetStringPropertyValueByName('first_name', UsagesStagingRecLcl.first_name);
                        JsonMgt.GetStringPropertyValueByName('last_name', UsagesStagingRecLcl.last_name);
                        JsonMgt.GetStringPropertyValueByName('account_zip', UsagesStagingRecLcl.account_zip);
                        JsonMgt.GetStringPropertyValueByName('group_name', UsagesStagingRecLcl.group_name);
                        JsonMgt.GetStringPropertyValueByName('peo_company', UsagesStagingRecLcl.peo_company);
                        JsonMgt.GetStringPropertyValueByName('peo_id', UsagesStagingRecLcl.peo_id);
                        JsonMgt.GetStringPropertyValueByName('privacy_optout', UsagesStagingRecLcl.privacy_optout);
                        JsonMgt.GetStringPropertyValueByName('submitted_at', UsagesStagingRecLcl.Submitted_at);
                        JsonMgt.GetStringPropertyValueByName('fee', UsagesStagingRecLcl.fee);
                        TotalJsonMgt.InitializeObject(ResponseTextVarLcl);

                        IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', UsageTotalText) then
                            TotalJsonMgt.GetStringPropertyValueByName('total', UsagesStagingRecLcl.total);
                        UsagesStagingRecLcl.Insert(true);
                    end;
                end;
                CMRXSetupRecLcl."Usages Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    Procedure GetContactData()
    var
        ContactStagingRecLcl: Record "CRX Contact Staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        ContactDetailsTxt: Text;
        ContactJsonText: Text;
        ContactTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Contact Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Contact Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Contact Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Contact Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('contacts', ContactJsonText) then begin
                ContactJsonText := ContactJsonText;

                ArrayJsonMgt.InitializeCollection(ContactJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(ContactDetailsTxt, i);
                    JsonMgt.InitializeObject(ContactDetailsTxt);
                    ContactStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', ContactStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('name', ContactStagingRecLcl.name);
                    JsonMgt.GetStringPropertyValueByName('note', ContactStagingRecLcl.note);
                    JsonMgt.GetStringPropertyValueByName('phone', ContactStagingRecLcl.phone);
                    JsonMgt.GetStringPropertyValueByName('email', ContactStagingRecLcl.email);
                    JsonMgt.GetStringPropertyValueByName('salesman_id', ContactStagingRecLcl.salesman_id);
                    JsonMgt.GetStringPropertyValueByName('broker_id', ContactStagingRecLcl.broker_id);
                    JsonMgt.GetStringPropertyValueByName('group_id', ContactStagingRecLcl.group_ids);
                    JsonMgt.GetStringPropertyValueByName('peo_ids', ContactStagingRecLcl.peo_ids);
                    ContactStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Contact Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    Procedure GetBrokersData()
    var
        BrokersStagingRecLcl: Record "CRX Brokers Staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        BrokersDetailsTxt: Text;
        BrokersJsonText: Text;
        BrokersTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Brokers Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Brokers Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Brokers Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Brokers Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('brokers', BrokersJsonText) then begin
                BrokersJsonText := BrokersJsonText;

                ArrayJsonMgt.InitializeCollection(BrokersJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(BrokersDetailsTxt, i);
                    JsonMgt.InitializeObject(BrokersDetailsTxt);
                    BrokersStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', BrokersStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('company', BrokersStagingRecLcl.company);
                    JsonMgt.GetStringPropertyValueByName('created_at', BrokersStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', BrokersStagingRecLcl.updated_at);

                    TotalJsonMgt.InitializeObject(ResponseTextVarLcl);
                    IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', BrokersTotalText) then
                        TotalJsonMgt.GetStringPropertyValueByName('total', BrokersStagingRecLcl.total);
                    BrokersStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Brokers Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    Procedure GetSalespersonData()
    var
        SalespersonStagingRecLcl: Record "CRX Salesperson Staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        SalespersonDetailsTxt: Text;
        SalespersonJsonText: Text;
        SalespersonTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Salesperson Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Salesperson Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Salesperson Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Salesperson Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('salesmen', SalespersonJsonText) then begin
                SalespersonJsonText := SalespersonJsonText;

                ArrayJsonMgt.InitializeCollection(SalespersonJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(SalespersonDetailsTxt, i);
                    JsonMgt.InitializeObject(SalespersonDetailsTxt);
                    SalespersonStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', SalespersonStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('username', SalespersonStagingRecLcl.username);
                    JsonMgt.GetStringPropertyValueByName('name', SalespersonStagingRecLcl.name);
                    JsonMgt.GetStringPropertyValueByName('email', SalespersonStagingRecLcl.email);
                    JsonMgt.GetStringPropertyValueByName('accounts_count', SalespersonStagingRecLcl.Signed_account_Count);
                    JsonMgt.GetStringPropertyValueByName('created_at', SalespersonStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', SalespersonStagingRecLcl.updated_at);
                    JsonMgt.GetStringPropertyValueByName('main_distributor_id', SalespersonStagingRecLcl.Main_Distributor_ID);
                    JsonMgt.GetStringPropertyValueByName('sub_distributor_id', SalespersonStagingRecLcl.Sub_Distributor_ID);
                    TotalJsonMgt.InitializeObject(ResponseTextVarLcl);
                    IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', SalespersonTotalText) then
                        TotalJsonMgt.GetStringPropertyValueByName('total', SalespersonStagingRecLcl.total);
                    SalespersonStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Salesperson Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    Procedure GetDistributorData()
    var
        DistributorStagingRecLcl: Record "CRX Distributors Staging";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        DistributorDetailsTxt: Text;
        DistributorJsonText: Text;
        DistributorTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Distributor Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Distributor URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Distributor Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Distributor URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('distributor', DistributorJsonText) then begin
                DistributorJsonText := DistributorJsonText;

                ArrayJsonMgt.InitializeCollection(DistributorJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(DistributorDetailsTxt, i);
                    JsonMgt.InitializeObject(DistributorDetailsTxt);
                    DistributorStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', DistributorStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('parent_id', DistributorStagingRecLcl.parent_id);
                    JsonMgt.GetStringPropertyValueByName('tier', DistributorStagingRecLcl.tier);
                    JsonMgt.GetStringPropertyValueByName('name', DistributorStagingRecLcl.name);
                    JsonMgt.GetStringPropertyValueByName('email', DistributorStagingRecLcl.email);
                    JsonMgt.GetStringPropertyValueByName('contact_name', DistributorStagingRecLcl.contact_name);
                    JsonMgt.GetStringPropertyValueByName('contact_note', DistributorStagingRecLcl.contact_note);
                    JsonMgt.GetStringPropertyValueByName('created_at', DistributorStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', DistributorStagingRecLcl.updated_at);
                    DistributorStagingRecLcl.Insert(true);
                end;
                CMRXSetupRecLcl."Distributor Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;


    procedure GetClaimData()
    var
        UsagesStagingRecLcl: Record "CRX Claim Staging";
        UsageidVarLcl: text[250];
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        UsageDetailsTxt: Text;
        UsageJsonText: Text;
        UsageTotalText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        TotalJsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';
        CMRXSetupRecLcl.Get();

        if CMRXSetupRecLcl."Claim Staging Last Sync" <> 0DT then
            URLVarLcl := CMRXSetupRecLcl."Claim Staging URL" + '&updated_after=' + Format(CMRXSetupRecLcl."Claim Staging Last Sync", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := CMRXSetupRecLcl."Claim Staging URL";

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode() THEN begin

            JsonMgt.InitializeObject(ResponseTextVarLcl);

            IF JsonMgt.GetArrayPropertyValueAsStringByName('claims', UsageJsonText) then begin

                ArrayJsonMgt.InitializeCollection(UsageJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(UsageDetailsTxt, i);
                    JsonMgt.InitializeObject(UsageDetailsTxt);

                    Clear(UsageidVarLcl);
                    JsonMgt.GetStringPropertyValueByName('id', UsageidVarLcl);
                    UsagesStagingRecLcl.Reset();
                    UsagesStagingRecLcl.SetRange(id, UsageidVarLcl);
                    if not UsagesStagingRecLcl.FindFirst() then begin
                        UsagesStagingRecLcl.Init();
                        JsonMgt.GetStringPropertyValueByName('id', UsagesStagingRecLcl.id);
                        JsonMgt.GetStringPropertyValueByName('account_id', UsagesStagingRecLcl.account_id);
                        JsonMgt.GetStringPropertyValueByName('provider', UsagesStagingRecLcl.provider);
                        JsonMgt.GetStringPropertyValueByName('bin', UsagesStagingRecLcl.bin);
                        JsonMgt.GetStringPropertyValueByName('npi', UsagesStagingRecLcl.npi);
                        JsonMgt.GetStringPropertyValueByName('brand', UsagesStagingRecLcl.brand);
                        JsonMgt.GetStringPropertyValueByName('ndc', UsagesStagingRecLcl.ndc);
                        JsonMgt.GetStringPropertyValueByName('drug_name', UsagesStagingRecLcl.drug_name);
                        JsonMgt.GetStringPropertyValueByName('dosage', UsagesStagingRecLcl.dosage);
                        JsonMgt.GetStringPropertyValueByName('extra', UsagesStagingRecLcl.extra);
                        JsonMgt.GetStringPropertyValueByName('price', UsagesStagingRecLcl.price);
                        JsonMgt.GetStringPropertyValueByName('quantity', UsagesStagingRecLcl.quantity);
                        JsonMgt.GetStringPropertyValueByName('created_at', UsagesStagingRecLcl.created_at);
                        JsonMgt.GetStringPropertyValueByName('member_id', UsagesStagingRecLcl.member_id);
                        JsonMgt.GetStringPropertyValueByName('group_id', UsagesStagingRecLcl.group_id);
                        JsonMgt.GetStringPropertyValueByName('email', UsagesStagingRecLcl.email);
                        JsonMgt.GetStringPropertyValueByName('phone', UsagesStagingRecLcl.phone);
                        JsonMgt.GetStringPropertyValueByName('age_range', UsagesStagingRecLcl.age_range);
                        JsonMgt.GetStringPropertyValueByName('ethnicity', UsagesStagingRecLcl.ethnicity);
                        JsonMgt.GetStringPropertyValueByName('sex', UsagesStagingRecLcl.sex);
                        JsonMgt.GetStringPropertyValueByName('first_name', UsagesStagingRecLcl.first_name);
                        JsonMgt.GetStringPropertyValueByName('last_name', UsagesStagingRecLcl.last_name);
                        JsonMgt.GetStringPropertyValueByName('account_zip', UsagesStagingRecLcl.account_zip);
                        JsonMgt.GetStringPropertyValueByName('group_name', UsagesStagingRecLcl.group_name);
                        JsonMgt.GetStringPropertyValueByName('peo_company', UsagesStagingRecLcl.peo_company);
                        JsonMgt.GetStringPropertyValueByName('peo_id', UsagesStagingRecLcl.peo_id);
                        JsonMgt.GetStringPropertyValueByName('privacy_optout', UsagesStagingRecLcl.privacy_optout);
                        JsonMgt.GetStringPropertyValueByName('submitted_at', UsagesStagingRecLcl.Submitted_at);
                        JsonMgt.GetStringPropertyValueByName('fee', UsagesStagingRecLcl."Fee ($)");
                        TotalJsonMgt.InitializeObject(ResponseTextVarLcl);

                        IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', UsageTotalText) then
                            TotalJsonMgt.GetStringPropertyValueByName('total', UsagesStagingRecLcl.total);
                        UsagesStagingRecLcl.Insert(true);
                    end;
                end;
                CMRXSetupRecLcl."Usages Staging Last Sync" := CurrentDateTime;
                CMRXSetupRecLcl.Modify();
            end;
        end;
    end;

    procedure GenerateAccessToken()
    var
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        JtokenVarLcl: JsonToken;
        URLVarLcl: Text;
        RawTextVarLcl: Text;
        ResponseTextVarLcl: Text;
    begin

        //URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/token';
        CMRXSetupRecLcl.Get();
        URLVarLcl := CMRXSetupRecLcl."Base URL" + '/exporter/token';

        RawTextVarLcl := GenerateJsonRequest();
        contentVarLcl.WriteFrom(RawTextVarLcl);
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        RequestVarLcl.Method := 'POST';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        JtokenVarLcl.ReadFrom(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode then begin
            AccessToken.FindFirst();
            AccessToken."Access Token" := GetValueasText(JtokenVarLcl, 'token');
            AccessToken.Modify();
        end else
            error('%1', ResponseVarLcl.ReasonPhrase);
    end;

    procedure GenerateJsonRequest(): Text
    var
        JsonObject: JsonObject;
        JsonText: Text;
    begin
        clear(JsonObject);
        Clear(JsonText);
        AccessToken.FindFirst();
        JsonObject.Add('username', AccessToken.UserName);
        JsonObject.Add('password', AccessToken.UserPassword);
        JsonObject.WriteTo(JsonText);
        exit(JsonText);
    end;

    procedure GetValueasText(Jtoken: JsonToken; ParamString: text): Text
    var
        Jobject: JsonObject;
    begin
        Jobject := Jtoken.AsObject();
        exit(SelectJsonToken(Jobject, ParamString));
    end;

    procedure SelectJsonToken(Jobject: JsonObject; Path: text): Text
    Var
        JToken: JsonToken;
    begin
        if Jobject.SelectToken(Path, JToken) then
            if not JToken.AsValue().IsNull() then
                exit(JToken.AsValue().AsText());
    end;

    procedure FetchAllAPIData()
    begin
        GetPeosData();
        GetBrokersData();
        GetGroupData();
        GetAccountData();
        GetContactData();
        GetUsagesData();
        GetSalespersonData();
        GetDistributorData();
        GetClaimData();
    end;

    procedure TestConnection()
    var
        CMRXSetupRec: Record "CRX Setup";
        APIConnecttionLogRecLcl: Record "CRX API Connection Log";
        CRXAPIConnetionLogVarLcl: Page "CRX API Connection Log";
    begin
        APIConnecttionLogRecLcl.DeleteAll();
        CMRXSetupRec.Get();
        APIConnection(CMRXSetupRec.FieldCaption("Accounts Staging URL"), CMRXSetupRec."Accounts Staging URL", CMRXSetupRec."Accounts Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Group Staging URL"), CMRXSetupRec."Group Staging URL", CMRXSetupRec."Group Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Peos Staging URL"), CMRXSetupRec."Peos Staging URL", CMRXSetupRec."Peos Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Usages Staging URL"), CMRXSetupRec."Usages Staging URL", CMRXSetupRec."Usages Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Contact Staging URL"), CMRXSetupRec."Contact Staging URL", CMRXSetupRec."Contact Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Brokers Staging URL"), CMRXSetupRec."Brokers Staging URL", CMRXSetupRec."Brokers Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Salesperson Staging URL"), CMRXSetupRec."Salesperson Staging URL", CMRXSetupRec."Salesperson Staging Last Sync");
        APIConnection(CMRXSetupRec.FieldCaption("Distributor URL"), CMRXSetupRec."Distributor URL", CMRXSetupRec."Distributor Staging Last Sync");

        APIConnecttionLogRecLcl.Reset();
        IF APIConnecttionLogRecLcl.FindSet() then begin
            Commit();
            CRXAPIConnetionLogVarLcl.RunModal()
        end else
            Message('All API are connected successfully.');


    end;

    procedure APIConnection(StagingCaption: text[1024]; StagingURL: text[1024]; LastSync: DateTime)
    var
        APIConnecttionLogRecLcl: Record "CRX API Connection Log";
        NewAPIConnecttionLogRecLcl: Record "CRX API Connection Log";
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        AcccountDetailsTxt: Text;
        AccountJsonText: Text;
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
        ArrayJsonMgt: Codeunit "JSON Management";
        JsonMgt: Codeunit "JSON Management";
        i: Integer;
    begin
        UTCVarLcl := '-05:00';

        if LastSync <> 0DT then
            URLVarLcl := StagingURL + '&updated_after=' + Format(LastSync, 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>:<Minutes,2>:<Seconds,2>') + UTCVarLcl
        else
            URLVarLcl := StagingURL;

        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        ClientVarLcl.DefaultRequestHeaders.Clear();
        ClientVarLcl.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AccessToken."Access Token");
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        if not ResponseVarLcl.IsSuccessStatusCode() THEN begin
            APIConnecttionLogRecLcl.Reset();
            IF APIConnecttionLogRecLcl.FindLast() THEN;

            NewAPIConnecttionLogRecLcl.Init();
            NewAPIConnecttionLogRecLcl."Entry No." := APIConnecttionLogRecLcl."Entry No." + 1;
            NewAPIConnecttionLogRecLcl."Error Message" := StagingCaption + ':' + CopyStr(ResponseTextVarLcl, 1, 1024);
            NewAPIConnecttionLogRecLcl.Insert();
        end;
    end;

    var
        AccessToken: Record "CRX Access Token";
        CMRXSetupRecLcl: Record "CRX Setup";
        UTCVarLcl: Text;
}
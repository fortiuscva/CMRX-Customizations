codeunit 50000 "CRX Access Token Management"
{
    trigger OnRun()
    begin

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
        URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/accounts/15';
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

            IF JsonMgt.GetArrayPropertyValueAsStringByName('account', AccountJsonText) then begin
                AccountJsonText := '[' + AccountJsonText + ']';

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
        URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/groups/5';
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

            IF JsonMgt.GetArrayPropertyValueAsStringByName('group', GroupJsonText) then begin
                GroupJsonText := '[' + GroupJsonText + ']';

                ArrayJsonMgt.InitializeCollection(GroupJsonText);
                for i := 0 to ArrayJsonMgt.GetCollectionCount() - 1 do begin
                    ArrayJsonMgt.GetObjectFromCollectionByIndex(GroupDetailsTxt, i);
                    JsonMgt.InitializeObject(GroupDetailsTxt);
                    GroupStagingRecLcl.Init();
                    JsonMgt.GetStringPropertyValueByName('id', GroupStagingRecLcl.id);
                    JsonMgt.GetStringPropertyValueByName('name', GroupStagingRecLcl.name);
                    JsonMgt.GetStringPropertyValueByName('peo_id', GroupStagingRecLcl.peo_id);
                    JsonMgt.GetStringPropertyValueByName('salesman_id', GroupStagingRecLcl.salesman_id);
                    JsonMgt.GetStringPropertyValueByName('created_at', GroupStagingRecLcl.created_at);
                    JsonMgt.GetStringPropertyValueByName('updated_at', GroupStagingRecLcl.updated_at);
                    JsonMgt.GetStringPropertyValueByName('contacts', GroupStagingRecLcl.contacts);
                    GroupStagingRecLcl.Insert(true);
                end;
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
        URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/peos/list?limit=15&offset=0&updated_after=2023-09-01 21:15:44';
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
                    JsonMgt.GetStringPropertyValueByName('contacts', PeosStagingRecLcl.contacts);

                    TotalJsonMgt.InitializeObject(ResponseTextVarLcl);

                    IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', PeosTotalText) then
                        TotalJsonMgt.GetStringPropertyValueByName('total', PeosStagingRecLcl.total);
                    PeosStagingRecLcl.Insert(true);
                end;
            end;
        end;
    end;

    procedure GetUsagesData()
    var
        UsagesStagingRecLcl: Record "CRX Usages Staging";
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
        URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/usages/list?limit=50&offset=0&created_after=2023-09-20 00:00:00';
        AccessToken.FindFirst();
        contentVarLcl.GetHeaders(HeaderVarLcl)
        ;
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
                    TotalJsonMgt.InitializeObject(ResponseTextVarLcl);

                    IF TotalJsonMgt.GetArrayPropertyValueAsStringByName('total', UsageTotalText) then
                        TotalJsonMgt.GetStringPropertyValueByName('total', UsagesStagingRecLcl.total);
                    UsagesStagingRecLcl.Insert(true);
                end;
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
        URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/contacts/list?limit=15&offset=0&updated_after=2023-09-01 21:15:44';
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
                    ContactStagingRecLcl.Insert(true);
                end;
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

        URLVarLcl := 'https://comparemedsrx.codebru.com' + '/exporter/token';

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
        end;
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

    var
        AccessToken: Record "CRX Access Token";
}
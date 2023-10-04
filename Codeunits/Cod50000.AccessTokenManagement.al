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
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        Jobbject: JsonObject;
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
            Clear(Jtoken);
            Clear(JArray);

            ResponseTextVarLcl := DelStr(ResponseTextVarLcl, StrLen(ResponseTextVarLcl), StrLen(ResponseTextVarLcl) - 1);
            ResponseTextVarLcl := CopyStr(ResponseTextVarLcl, 12, StrLen(ResponseTextVarLcl));
            ResponseTextVarLcl := '[' + ResponseTextVarLcl + ']';

            Jtoken.ReadFrom(ResponseTextVarLcl);
            JArray := Jtoken.AsArray();

            foreach Jtoken in Jarray do begin
                AccountStagingRecLcl.Init();
                AccountStagingRecLcl.id := GetValueasText(Jtoken, 'id');
                AccountStagingRecLcl.first_name := GetValueasText(Jtoken, 'first_name');
                AccountStagingRecLcl.last_name := GetValueasText(Jtoken, 'last_name');
                AccountStagingRecLcl.email := GetValueasText(Jtoken, 'email');
                AccountStagingRecLcl.phone := GetValueasText(Jtoken, 'phone');
                AccountStagingRecLcl.group_id := GetValueasText(Jtoken, 'group_id');
                AccountStagingRecLcl.zip := GetValueasText(Jtoken, 'zip');
                AccountStagingRecLcl.sex := GetValueasText(Jtoken, 'sex');
                AccountStagingRecLcl.ethnicity := GetValueasText(Jtoken, 'ethnicity');
                AccountStagingRecLcl.age_range := GetValueasText(Jtoken, 'age_range');
                AccountStagingRecLcl.affiliate_id := GetValueasText(Jtoken, 'affiliate_id');
                AccountStagingRecLcl.privacy_optout := GetValueasText(Jtoken, 'privacy_optout');
                AccountStagingRecLcl.created_at := GetValueasText(Jtoken, 'created_at');
                AccountStagingRecLcl.updated_at := GetValueasText(Jtoken, 'updated_at');
                AccountStagingRecLcl.Insert(true);
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
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
        JObject: JsonObject;
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
            Clear(Jtoken);
            Clear(JArray);

            Jtoken.ReadFrom(ResponseTextVarLcl);
            JObject := Jtoken.AsObject();
            JObject.SelectToken('group', Jtoken);
            JArray := Jtoken.AsArray();

            foreach Jtoken in Jarray do begin
                GroupStagingRecLcl.Init();
                GroupStagingRecLcl.id := GetValueasText(Jtoken, 'id');
                GroupStagingRecLcl.name := GetValueasText(Jtoken, 'name');
                GroupStagingRecLcl.peo_id := GetValueasText(Jtoken, 'peo_id');
                GroupStagingRecLcl.salesman_id := GetValueasText(Jtoken, 'salesman_id');
                GroupStagingRecLcl.created_at := GetValueasText(Jtoken, 'created_at');
                GroupStagingRecLcl.updated_at := GetValueasText(Jtoken, 'updated_at');
                GroupStagingRecLcl.contacts := GetValueasText(Jtoken, 'contacts');
                GroupStagingRecLcl.Insert(true);
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
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
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
            Clear(Jtoken);
            Clear(JArray);


            Jtoken.ReadFrom(ResponseTextVarLcl);
            JArray := Jtoken.AsArray();

            foreach Jtoken in Jarray do begin
                PeosStagingRecLcl.Init();
                PeosStagingRecLcl.id := GetValueasText(Jtoken, 'id');
                PeosStagingRecLcl.company := GetValueasText(Jtoken, 'company');
                PeosStagingRecLcl.created_at := GetValueasText(Jtoken, 'created_at');
                PeosStagingRecLcl.updated_at := GetValueasText(Jtoken, 'updated_at');
                PeosStagingRecLcl.contacts := GetValueasText(Jtoken, 'contacts');
                PeosStagingRecLcl.Insert(true);
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
        URLVarLcl: Text;
        ResponseTextVarLcl: Text;
        JArray: JsonArray;
        Jtoken: JsonToken;
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
            Clear(Jtoken);
            Clear(JArray);

            ResponseTextVarLcl := DelStr(ResponseTextVarLcl, StrLen(ResponseTextVarLcl), StrLen(ResponseTextVarLcl) - 1);
            ResponseTextVarLcl := CopyStr(ResponseTextVarLcl, 11, StrLen(ResponseTextVarLcl));
            ResponseTextVarLcl := '[' + ResponseTextVarLcl + ']';

            Jtoken.ReadFrom(ResponseTextVarLcl);
            JArray := Jtoken.AsArray();

            foreach Jtoken in Jarray do begin
                UsagesStagingRecLcl.Init();
                UsagesStagingRecLcl.id := GetValueasText(Jtoken, 'id');
                UsagesStagingRecLcl.account_id := GetValueasText(Jtoken, 'account_id');
                UsagesStagingRecLcl.provider := GetValueasText(Jtoken, 'provider');
                UsagesStagingRecLcl.bin := GetValueasText(Jtoken, 'bin');
                UsagesStagingRecLcl.npi := GetValueasText(Jtoken, 'npi');
                UsagesStagingRecLcl.brand := GetValueasText(Jtoken, 'brand');
                UsagesStagingRecLcl.ndc := GetValueasText(Jtoken, 'ndc');
                UsagesStagingRecLcl.drug_name := GetValueasText(Jtoken, 'drug_name');
                UsagesStagingRecLcl.extra := GetValueasText(Jtoken, 'extra');
                UsagesStagingRecLcl.price := GetValueasText(Jtoken, 'price');
                UsagesStagingRecLcl.quantity := GetValueasText(Jtoken, 'quantity');
                UsagesStagingRecLcl.created_at := GetValueasText(Jtoken, 'created_at');
                UsagesStagingRecLcl.member_id := GetValueasText(Jtoken, 'member_id');
                UsagesStagingRecLcl.group_id := GetValueasText(Jtoken, 'group_id');
                UsagesStagingRecLcl.email := GetValueasText(Jtoken, 'email');
                UsagesStagingRecLcl.phone := GetValueasText(Jtoken, 'phone');
                UsagesStagingRecLcl.age_range := GetValueasText(Jtoken, 'age_range');
                UsagesStagingRecLcl.ethnicity := GetValueasText(Jtoken, 'ethnicity');
                UsagesStagingRecLcl.sex := GetValueasText(Jtoken, 'sex');
                UsagesStagingRecLcl.first_name := GetValueasText(Jtoken, 'first_name');
                UsagesStagingRecLcl.last_name := GetValueasText(Jtoken, 'last_name');
                UsagesStagingRecLcl.account_zip := GetValueasText(Jtoken, 'account_zip');
                UsagesStagingRecLcl.group_name := GetValueasText(Jtoken, 'group_name');
                UsagesStagingRecLcl.peo_company := GetValueasText(Jtoken, 'peo_company');
                UsagesStagingRecLcl.peo_id := GetValueasText(Jtoken, 'peo_id');
                UsagesStagingRecLcl.privacy_optout := GetValueasText(Jtoken, 'privacy_optout');
                UsagesStagingRecLcl.Insert(true);
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
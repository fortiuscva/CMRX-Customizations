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
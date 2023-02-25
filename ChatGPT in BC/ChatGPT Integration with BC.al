codeunit 50106 "ChatGPT Integration with BC"
{

    
    procedure SendMessage(apiKey: Text; message: Text): Text
    var

        Client: HttpClient;
        Headers: HttpHeaders;
        request: HttpRequestMessage;
        response: HttpResponseMessage;
        json: JsonObject;
        content: HttpContent;
        data: Text;
        model: text;
        maxtoken: Integer;
        temperature: Integer;
        topp: Integer;
        freqpenal: Integer;
        presencepenalty: Integer;


    begin

        model := 'text-davinci-003';
        maxtoken := 2000;
        temperature := 1;
        topp := 1;
        freqpenal := 0;
        presencepenalty := 1;
        json.Add('model', model);
        json.Add('prompt', message);
        json.Add('max_tokens', maxtoken);
        json.Add('temperature', temperature);
        json.Add('top_p', topp);
        json.Add('frequency_penalty', freqpenal);
        json.Add('presence_penalty', presencepenalty);


        request.Method := 'POST';
        request.SetRequestUri('https://api.openai.com/v1/completions');
        Request.GetHeaders(Headers);
        Headers.Add('Authorization', 'Bearer ' + apiKey);
        content.WriteFrom(Format(json));

        content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.TryAddWithoutValidation('Content-Type', 'application/json');
        request.Content := content;

        
        Client.Send(request, response);

       
        if response.HttpStatusCode <> 200 then begin
            
            Error('Error sending message to ChatGPT.');
        end;

              
        response.Content.ReadAs(data);
        data := ReadResponse(data);
        
        exit(data);
    end;

    local procedure CreateRequestJSONForAccessRefreshToken(var JsonString: Text; ServiceURL: Text; URLRequestPath: Text; var ContentJson: JsonObject)
    var
        JObject: JsonObject;
    begin
        if JObject.ReadFrom(JsonString) then;
        JObject.Add('ServiceURL', ServiceURL);
        JObject.Add('Method', 'POST');
        JObject.Add('URLRequestPath', URLRequestPath);
        JObject.Add('Content-Type', 'application/json');
        JObject.Add('Content', ContentJson);
        JObject.WriteTo(JsonString);
    end;

    local procedure ReadResponse(data: Text): Text
    var
        obj: JsonObject;
        O2: JsonObject;
        item: JsonObject;
        Token: JsonToken;
        T2: JsonToken;
        T3: JsonToken;
        ja: JsonArray;
        v: JsonValue;
        txt: Text;
    begin
        obj.ReadFrom(data);
        if obj.Contains('choices') then begin
            obj.get('choices', Token);
            foreach T2 in Token.AsArray() do begin
                if T2.IsObject() then begin
                    O2 := T2.AsObject();
                    O2.Get('text', T3);
                    if T3.IsValue() then begin
                        V := T3.AsValue();
                        txt := CopyStr(V.AsText(), 1, 240);
                        InsertResponse('ChatGPT: ' + txt);
                    end;
                end;
            end;
        end;
        if txt <> '' then
            txt := CopyStr(txt, 1, 250);
        exit(txt);
    end;

    procedure InsertResponse(ConVer: Text)
    var
        ChatGPTConver: Record "Chat GPT";
        LastLine: Integer;
    begin
        if ChatGPTConver.FindLast() then
            LastLine := ChatGPTConver."Entry No.";

        ChatGPTConver.Init();
        ChatGPTConver."Entry No." := LastLine + 1;
        ChatGPTConver.Message := ConVer;
        ChatGPTConver.Insert();
    end;

}

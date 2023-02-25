page 50112 "Chat GPT"
{
    ApplicationArea = All;
    PageType = List;
    Caption = 'Chat GPT Integration';
    SourceTable = "Chat GPT";
    SourceTableView = order(descending);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            field(MessageToSend; MessageToSend)
            {
                ApplicationArea = All;
                Caption = 'Ask Question to Chat GPT';
                trigger OnValidate()
                begin
                    APIKEY := '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';
                    if MessageToSend <> '' then begin
                        ChatGPTIntegrationwithBC.InsertResponse('Me: ' + MessageToSend);
                        Commit();
                        CurrPage.Update(false);
                        response := ChatGPTIntegrationwithBC.SendMessage(APIKEY, MessageToSend);
                        MessageToSend := '';
                        CurrPage.Update(false);
                    end;
                end;
            }
            repeater(General)
            {
                Editable = false;
                field(Message; Rec.Message)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Message field.';
                    MultiLine = true;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ODTChatGPT)
            {
                ApplicationArea = All;
                Caption = 'Send message to ChatGPT';
                ObsoleteState = Pending;
                ObsoleteReason = 'trigger will be in text/field onvalidate';

                trigger OnAction()

                begin
                    response := ChatGPTIntegrationwithBC.SendMessage(APIKey, MessageToSend);
                    Message(response);
                end;
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     MessageToSend := 'create business central api?';
    //     ChatGPTSetup.FindFirst();
    // end;


    var
        ChatGPTIntegrationwithBC: Codeunit "ChatGPT Integration with BC";
        //ChatGPTSetup: Record "Chat GPT Setup";
        MessageToSend, response : Text;
        APIKEY: text;
}

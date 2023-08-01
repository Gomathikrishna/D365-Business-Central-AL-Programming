page 50120 TryPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;


    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    try.Run();
                end;
            }
        }
    }

    var
        try: Codeunit Tryblock;
}
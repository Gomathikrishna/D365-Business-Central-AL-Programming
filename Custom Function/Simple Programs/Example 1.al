page 50111 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


  actions
    {
        area(Processing)
        {
            action("Calling Simple Procedure")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MyProcedure();
                end;
            }
        }
    }

    local procedure MyProcedure()
    var
        myInt: Integer;
    begin
        myInt := 1 + 1;
        Message(Format(myInt));
    end;
}

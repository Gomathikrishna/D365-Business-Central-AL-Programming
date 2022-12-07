page 50111 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(age; age)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        MyProcedure();
                    end;

                }
            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action("Validate age")
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin
    //                 MyProcedure();
    //             end;
    //         }
    //     }
    // }

    var
        age: Integer;

    local procedure MyProcedure()
    var
        Text001: Label 'Eligible';
        Text002: Label 'Not Eligible';
    begin
        if age >= 18 then
            Message(Text001)
        Else
            Error(Text002);
    end;
}
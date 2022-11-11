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

page 50112 validate
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

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    validateage();
                end;
            }
        }
    }

    var
        age: Integer;

    procedure validateage()
    var
        Text001: Label 'Eligible';
        Text002: Label 'Not eligible';

    begin
        if age >= 16 then
            Message(Text001)
        else
            Error(Text002);
    end;
}

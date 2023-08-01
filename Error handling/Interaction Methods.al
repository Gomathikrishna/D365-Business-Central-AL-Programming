page 50121 Interaction
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Interaction Card';
    actions
    {
        area(Processing)
        {
            action(Message)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    begin
                        MyInt := 5;
                        Message(TheValueOfTxt, 'MyInt', MyInt);
                        // Displays: The value of MyInt is 5
                    end;
                end;
            }
            action(Confirm)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to delete?') then
                        Message('OK')
                    else
                        Message('Not OK');
                end;
            }
            action(strmenu)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Days := 'Monday,Tuesday,Wednesday,Thursday,Friday';
                    Selection := StrMenu(Days, 1, 'Which day is today ?');
                    Message('You selected %1.', Selection);
                end;
            }
            action(Error)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MESSAGE('1');
                    ERROR('OOPS !');
                    MESSAGE('2');
                end;
            }
        }
    }

    var
        MyInt: Integer;
        TheValueOfTxt: Label 'The value of %1 is %2';
        Days: Text[50];
        Selection: Integer;
}
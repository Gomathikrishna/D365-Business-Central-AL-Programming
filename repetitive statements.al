page 50116 "Repetitive Statements"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Repetitive Statements';

    layout
    {
        area(Content)
        {
            group("Input for Switch")
            {
                Caption = 'Input';
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;
                    Caption = 'Difficulty';
                    ToolTip = 'Select the Difficulty.';
                    trigger OnValidate()
                    begin
                        GetSuggestion();
                    end;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Caption = 'Suggestion';
                    ToolTip = 'Suggestion.';
                    Editable = false;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Caption = 'Level';
                    ToolTip = 'Level.';
                    Editable = false;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action("Execute For loop")
            {
                ApplicationArea = All;
                Caption = 'Try for loop';

                trigger OnAction()
                begin
                    Tryfor();
                end;
            }

            action("Execute For down to loop")
            {
                ApplicationArea = All;
                Caption = 'Try for down to loop';

                trigger OnAction()
                begin
                    Tryfordownto();
                end;
            }

            action("Execute For each")
            {
                ApplicationArea = All;
                Caption = 'Try for each';

                trigger OnAction()
                begin
                    Tryforeach();
                end;
            }

            action("Execute while loop")
            {
                ApplicationArea = All;
                Caption = 'Try while loop';

                trigger OnAction()
                begin
                    Trywhile();
                end;
            }

            action("Execute repeat until loop")
            {
                ApplicationArea = All;
                Caption = 'Try repeat until loop';

                trigger OnAction()
                begin
                    tryrepeat();
                end;
            }
        }
    }


    var
        Level: Text[30];
        Suggestion: Text[150];
        Difficulty: Integer;
        // for variables
        total: Integer;
        intCount: Integer;

        //for down to variables
        intCount1: Integer;
        totalSales: Integer;
        numberSales: Integer;
        sales: array[5] of Integer;


        //for each

        stringList: List of [Text[20]];
        stringItem: Text[20];


        //while

        index: Integer;
        totalSaless: Integer;
        saless: array[5] of Integer;



    local procedure Tryfor()

    begin
        total := 0;
        for intCount := 1 to 5 do
            total := total + 3;
        Message('%1', total);
    end;

    local procedure Tryfordownto()

    begin
        sales[1] := 20;
        sales[2] := 10;
        sales[3] := 30;
        sales[4] := 15;
        sales[5] := 25;

        totalSales := 0;
        for intCount1 := 5 downto 1 do begin
            totalSales := totalSales + sales[intCount1];
            //intCount1 := intCount1 - 1;
        end;
        Message('%1', totalSales);
    end;

    local procedure Tryforeach()
    begin
        stringList.Add('Krishna');
        stringList.Add('Shrimathi');
        stringList.Add('Vishwa');
        stringList.Add('Ramya');
        foreach stringItem in stringList do
            Message(stringItem);
    end;


    local procedure Trywhile()
    begin
        totalSaless := 10;
        index := 0;
        saless[1] := 10;
        saless[2] := 30;
        saless[3] := 15;
        saless[4] := 25;
        while totalSaless > 10 do begin
            index := index + 1;
            totalSaless := totalSaless + saless[index];
            Message('%1', totalSaless);
        end;

    end;

    local procedure tryrepeat()
    begin
        index := 0;
        totalSaless := 10;
        saless[1] := 10;
        saless[2] := 30;
        saless[3] := 15;
        saless[4] := 25;
        saless[5] := 25;
        repeat
            index := index + 1;
            totalSaless := totalSaless + saless[index];
            Message('Sales is greater than 10: %1', totalSaless);
        until totalSaless > 10;

    end;


    //Switch case
    local procedure GetSuggestion()
    begin
        Level := '';
        Suggestion := '';

        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Novice';
                    Suggestion := 'Learn from Microsoft Learn: https://learn.microsoft.com/en-us/training/paths/get-started-dynamics-365-business-central/';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Expert';
                    Suggestion := 'Try Projects and more exercises';
                end;
        end;
    end;




}

page 50102 "Conditional Statement"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(salary; salary)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if salary < 10000 then
                            Error('OOPS! you entered wrong salary')
                        else
                            Message('Good to go');

                    end;

                }
                field(tot; tot)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        if tot < 5000 then
                            Message('You will get 5% discount')
                        else
                            if (tot > 5000) and
                            (tot < 10000) and
                            (tot <> 9999) then
                                Message('You will get 10% discount')
                            else
                                if (tot > 10000) and
                                (tot < 15000) then
                                    Message('You will get 15% discount');

                    end;


                }
            }
            group("Input for Switch")
            {
                Caption = 'Input for Switch';
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
                Caption = 'Output foe switch';
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


    var
        salary: Decimal;

        tot: Decimal;

    var
        Level: Text[30];
        Suggestion: Text[150];
        Difficulty: Integer;
        qua: Integer;

    local procedure GetSuggestion()
    begin
        Level := '';
        Suggestion := '';

        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Novice';
                    Suggestion := 'Learn from Microsoft Learn';
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
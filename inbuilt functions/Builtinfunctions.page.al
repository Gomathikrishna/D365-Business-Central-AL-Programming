page 50106 "Built-in functions"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
            }

            group(Output)
            {
                field(ConvertedText; ConvertedText)
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
            group("In-built function")
            {
                group("String functions")
                {
                    action("Lower Case")
                    {
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            ConvertedText := LowerCase(Name);
                        end;
                    }
                    action("Conver String")
                    {
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            ConvertedText := ConvertStr(Name, 'dolly', 'Polly');
                        end;
                    }

                }
            }
        }
    }


    var
        Name: Text[30];
        ConvertedText: Text[30];
}
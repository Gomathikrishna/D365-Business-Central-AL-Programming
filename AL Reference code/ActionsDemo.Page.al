page 50101 "Actions Demo"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;


    layout
    {
        area(Content)
        {

            group(Input)

            {
                Caption = 'Input';
                field(Initialamount; Initialamount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Initial Amount';
                    Caption = 'Initial Amount';

                }
                field(NoOfYears; NoOfYears)
                {
                    ApplicationArea = All;

                }
                field(RateOfInterest; RateOfInterest)
                {
                    ApplicationArea = All;

                }
            }

            group(Output)

            {
                Caption = 'Output';
                field(FinalAmount; FinalAmount)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Calculate Simple Interest")
            {
                ApplicationArea = All;
                Caption = 'Calculate the Interest';
                Image = ExecuteBatch;
                ToolTip = 'Interest Calculation';
                trigger OnAction()
                begin

                    FinalAmount := Initialamount * (1 + RateOfInterest * NoOfYears);
                end;
            }
        }
    }

    var
        Initialamount: Decimal;
        NoOfYears: Integer;
        RateOfInterest: Decimal;

        FinalAmount: Decimal;
}
page 50118 "BC Cue"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            cuegroup(Group1)
            {
                Caption = 'Cue group 1';
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Balance';

                }

                field("Inv. Amounts (LCY)"; Rec."Inv. Amounts (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance Due';
                    Style = Attention;

                }

                field(MyNumber; MyNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Number';

                    StyleExpr = 'Red';
                    trigger OnDrillDown()

                    begin
                        Message('Yah, you did it');
                    end;

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

                end;
            }
        }
    }

    trigger OnOpenPage()

    begin
        MyNumber := 100;
    end;

    var
        MyNumber: Integer;

}

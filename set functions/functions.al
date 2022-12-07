page 50108 setcalcfield
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    actions
    {
        area(Processing)
        {
            action(calcfield)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF (customer.Find('-') = true) then
                        repeat
                            customer.CalcFields(Balance, "Net change");
                        until (customer.Next = 0);
                    Message('Net Change %1', customer.Balance)
                end;
            }

            action(autocalcfield)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    customer.SetAutoCalcFields(Balance, "Net change");
                    if (customer.Find('-') = true) then
                        repeat
                        //Write your code here
                        until (customer.Next = 0);
                    Message('Net Change %1', customer.Balance)

                end;
            }
        }
    }

    var
        customer: Record Customer;
}
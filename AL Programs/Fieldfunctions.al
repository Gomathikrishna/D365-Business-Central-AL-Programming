//Difference between Error and field Error in business central AL programming
page 50103 fieldfunctions
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        item: Record Item;
                        custo: Record Customer;
                    begin
                        if Rec."Unit Price" > 10 then
                            item.FieldError("Unit Price", 'Unit Price cannot be greater than 10');

                    end;

                }

                field(amount; amount)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if amount > 10 then
                            Error('Amount cannot be greater than 10');



                    end;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(setcalcfields)
            {
                ApplicationArea = All;

                trigger OnAction()
                var

                begin


                end;
            }

        }
    }
    var
        amount: Decimal;

}
page 50115 "Options and Enum"
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
                field(Gender; Gender)
                {
                    ApplicationArea = All;
                    Caption = 'Option';

                }
                field(status; status)
                {
                    ApplicationArea = All;
                    Caption = 'Enum';

                }
                field(payment; payment)
                {
                    ApplicationArea = all;
                    Caption = 'Payment';
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

    var
        Gender: Option male,female,"prefer not to say";
        status: Enum status;

        payment: Enum "Payment Method";
}
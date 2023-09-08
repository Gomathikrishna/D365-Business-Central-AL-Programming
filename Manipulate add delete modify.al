page 50104 Manipulatedata
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Manipulate Data - Add Modify Delete';


    actions
    {
        area(Processing)
        {
            action(Insert)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    customer.Init();
                    customer."No." := '4711';
                    customer.Name := 'Dr. Gomathi S';
                    customer.Insert(true);
                end;
            }
            action(Modify)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    customer.Get('4711');
                    customer.Name := 'Krishna';
                    customer.Modify();
                end;
            }
            action(Modifyall)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    customer.SetRange("Salesperson Code", 'JO');
                    customer.ModifyAll("Salesperson Code", 'JR');
                end;
            }
            action(Delete)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    customer.Get('4711');
                    customer.Delete(true);
                end;
            }
            action(DeleteAll)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    customer.SetRange("Salesperson Code", 'PS');
                    customer.DeleteAll();
                end;
            }
        }
    }

    var
        customer: Record Customer;
}
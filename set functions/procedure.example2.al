page 50112 typesoffunction
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    // layout
    // {
    //     area(Content)
    //     {
    //         group(GroupName)
    //         {
    //             field(Name; NameSource)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    actions
    {
        area(Processing)
        {
            action("Pass by value")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    int1 := 23;
                    res := MyProcedure(int1);
                    Message('Intger1 %1', int1); //display 23
                    Message('Intger1 %1', res); //display 20

                end;
            }

            action("Pass by reference")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    int1 := 23;
                    res := MyProcedure1(int1);
                    Message('Intger1 %1', int1);
                    Message('Intger1 %1', res);

                end;
            }

            action("Customer Call - pass complex types")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    GetCustomername('Deerfield');
                end;
            }
        }
    }
    var
        int1: Integer;
        res: Integer;

    procedure MyProcedure(parameter1: Integer): Integer

    begin
        parameter1 := 20;
        exit(parameter1);
    end;

    procedure MyProcedure1(var parameter1: Integer): Integer

    begin
        parameter1 := 20;
        exit(parameter1);
    end;

    procedure GetCustomername(Name: Text): Record Customer
    var
        Customer: Record Customer;
    begin
        Customer.SetFilter(Name, '@' + Name + '*');
        Customer.FindFirst();
        Message('%1', Name);
        exit(Customer);
    end;
}
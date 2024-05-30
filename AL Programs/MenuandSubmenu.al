pageextension 50111 ExtendNavigationArea extends "Order Processor Role Center"
{

    actions
    {
        addlast(Sections)
        {
            group("My Customers")
            {
                action("Customer Bank Account List")
                {
                    RunObject = page "Customer Bank Account List";
                    ApplicationArea = All;
                }
                action("Customer Ledger Entries")
                {
                    RunObject = page "Customer Ledger Entries";
                    ApplicationArea = All;
                }

                // Creates a sub-menu
                group("Sales Documents")
                {
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Entity";
                    }
                    action("Sales Document Line Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Line Entity";
                    }
                }
            }
        }
    }
}
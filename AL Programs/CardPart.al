page 50111 "CustomerSales"
{
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            // Display data as cue tiles
            cuegroup(Overview)
            {
                field("No. of Quotes"; Rec."No. of Quotes")
                {
                    ApplicationArea = All;
                    // Make the cue interactive
                    DrillDownPageID = "Sales Quotes";
                }
                field("No. of Orders"; Rec."No. of Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Sales Order List";
                }
                field("No. of Invoices"; Rec."No. of Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Sales Invoice List";
                }
            }
        }
    }
}

page 50109 "Pending Shipments"
{
    PageType = ListPart;
    SourceTable = "Sales Header";
    // Filter on the sales orders that are pending completion.
    SourceTableView = WHERE("Completely Shipped" = CONST(False));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order";
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
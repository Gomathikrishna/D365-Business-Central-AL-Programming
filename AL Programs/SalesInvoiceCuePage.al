page 50108 SalesInvoiceCuePage
{
    PageType = CardPart;
    SourceTable = SalesInvoiceCueTable;

    layout
    {
        area(content)
        {
            cuegroup(SalesCueContainer)
            {
                Caption = 'Sales Invoices';
                // CuegroupLayout=Wide;
                field(SalesCue; Rec.SalesInvoicesOpen)
                {
                    Caption = 'Open';
                    DrillDownPageId = "Sales Invoice List";
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
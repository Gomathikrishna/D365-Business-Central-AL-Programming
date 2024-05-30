page 50125 RoleCenterName
{
    PageType = RoleCenter;
    Caption = 'My Role Center Try';
    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; RoleCenterHeadline)
                {
                    ApplicationArea = All;
                }

            }

            group(Customer)
            {
                part("Customer Sales History"; "Customer Sales Lines")
                {
                    ApplicationArea = All;
                }
            }

            group(Shipments)
            {
                part("Pending Shipments"; "Pending Shipments")
                {
                    ApplicationArea = all;
                }
            }
        }

    }

    actions
    {
        area(Sections)
        {
            group(PostedInvoices)
            {
                Caption = 'Posted invoices';
                Image = RegisteredDocs;
                action(PostedServiceInvoice)
                {
                    Caption = 'Posted Service Invoices';
                    RunObject = Page "Posted Service Invoices";
                    ApplicationArea = All;
                }
                action(POstesSalesInvoice)
                {
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ApplicationArea = All;
                }
                group(SalesDocument)
                {
                    Caption = 'Sales Document';

                    action(SalesOrder)
                    {
                        Caption = 'Sales Order';
                        RunObject = Page "Sales Order";
                        ApplicationArea = All;
                    }
                    action(SalesInvoice)
                    {
                        Caption = 'Sales Invoice';
                        RunObject = Page "Sales Invoice";
                        ApplicationArea = All;
                    }

                }
            }
        }
        area(Embedding)
        {
            action(Sales)
            {
                Caption = 'Sales Lists';
                RunObject = Page "Sales List";
                ApplicationArea = all;

            }
            action(Purchase)
            {
                Caption = 'Purchase Lists';
                RunObject = Page "Purchase List";
                ApplicationArea = all;

            }
            action(Services)
            {
                Caption = 'Service Lists';
                RunObject = Page "Service List";
                ApplicationArea = all;

            }
            action(Inventory)
            {
                Caption = 'Inventory Lists';
                RunObject = Page "Inventory Comment List";
                ApplicationArea = all;

            }
        }

        area(Creation)
        {
            action(AddSalesOrder)
            {
                Caption = 'Add Sales Order';
                RunObject = Page "Sales Order";
                ApplicationArea = All;
                RunPageMode = Create;
            }
            action(AddSalesInvoice)
            {
                Caption = 'Add Sales Invoice';
                RunObject = Page "Sales Invoice";
                ApplicationArea = All;
                RunPageMode = Create;
            }
            action(AddPurchaseOrder)
            {
                Caption = 'Add Purchase Order';
                RunObject = Page "Purchase Order";
                ApplicationArea = All;
                RunPageMode = Create;
            }
        }
        area(Processing)
        {
            action(SalesInvoiceProcess)
            {
                Caption = 'Sales Invoice';
                RunObject = Page "Sales Invoice";
                ApplicationArea = All;
            }
        }

        area(Reporting)
        {
            action(SalesInvoiceReport)
            {
                Caption = 'Sales Invoice Report';
                RunObject = Report "Standard Sales - Invoice";
                ApplicationArea = All;
                Image = Report;
            }
        }


    }
}
profile DemoProfile
{
    ProfileDescription = 'Demo Profile';
    RoleCenter = RoleCenterName;
    Caption = 'Demo Profile';
}
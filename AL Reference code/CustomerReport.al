report 50104 "Report for Multiple Tables"
{

    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Customer Report.rdl';

    dataset
    {

        dataitem(Customer; Customer)
        {
            DataItemTableView = Sorting("No.");
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = True;

            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }

            column(Name_Customer; Name)
            {
                IncludeCaption = true;

            }

            dataitem(CustLedger; "Cust. Ledger Entry")
            {

                DataItemTableView = sorting("Entry no.");
                DataItemLink = "Customer No." = field("No.");

                column(EntryNo_CustLedgerEntry; "Entry No.")
                {
                    IncludeCaption = true;

                }
                column(CustomerNo_CustLedgerEntry; "Customer No.")
                {
                    IncludeCaption = true;

                }
                column(Amount_CustLedgerEntry; Amount)
                {
                    IncludeCaption = true;

                }


            }


        }
    }

    // These labels will be used later as captions in the report layout.  
    labels
    {
        Total_Caption = 'Total';
    }
}
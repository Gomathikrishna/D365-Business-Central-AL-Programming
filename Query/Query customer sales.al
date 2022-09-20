query 50108 "Customer sales by quantity"
{
    QueryType = Normal;
    OrderBy = descending(Quantity);

    elements
    {
        dataitem(Cus; Customer)
        {

            column(CustNo; "No.")
            {

            }
            column(CustName; Name)
            {

            }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Cus."No.";
                SqlJoinType = InnerJoin;

                column(Quantity; Quantity)
                {

                }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}
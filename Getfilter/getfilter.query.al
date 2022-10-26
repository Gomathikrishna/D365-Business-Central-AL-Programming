query 50105 sales_quantity
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {

            }
            column(No_; "No.")
            { }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "No." = Customer."No.";
                SqlJoinType = InnerJoin;
                column(Quantity; Quantity)
                { }
                filter(Quanity_filter; Quantity)
                {
                    ColumnFilter = Quanity_filter = filter(> 5);
                }
            }

        }
    }

}
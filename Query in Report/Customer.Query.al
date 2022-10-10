query 50109 TopNCustomers
{
    QueryType = Normal;
    OrderBy = ascending(BalanceLCY);
    //QueryCategory = 'Customer List';
    //Caption = 'Top N Customers';
    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            { }
            column(Name; Name)
            { }
            column(BalanceLCY; "Balance (LCY)")
            { }
            column(City; City) { }
        }
    }
}
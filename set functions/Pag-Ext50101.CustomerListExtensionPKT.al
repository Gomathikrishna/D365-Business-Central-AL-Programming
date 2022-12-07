pageextension 50123 CustomerListExtension_PKT extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("Assign Default Category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assigns the Default Category to all Customers';

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "Customer Category Mgt_PKT";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory();
                end;
            }
        }
    }
    views
    {
        addlast
        {
            view(CustomersWithoutCategory)
            {
                Caption = 'Customers without Category assigned';
                Filters = where("Customer Category Code_PKT" = filter(''));
            }
        }
    }
}


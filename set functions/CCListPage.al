page 50121 "Customer Category List_PKT"
{
    PageType = List;
    SourceTable = "Customer Category_PKT";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = CustomerCategoryCard_PKT;
    Caption = 'Customer Category List';
    AdditionalSearchTerms = 'ranking, categorization';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = All;
                }
                field(TotalCustomersForCategory; Rec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Create Default Category")
            {
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Create default category';
                Caption = 'Create default category';
                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Category Mgt_PKT";
                begin
                    CustManagement.CreateDefaultCategory();
                end;
            }
        }
    }
}
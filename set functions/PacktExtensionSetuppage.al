page 50124 "Packt Extension Setup page"
{

    Caption = 'Packt Extension Setup page';
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Packt Extension Setup";
    UsageCategory = Lists;



    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Minimum Accepted Vendor Rate"; Rec."Minimum Accepted Vendor Rate")
                {
                    ToolTip = 'Specifies the value of the Minimum Accepted Vendor Rate for Purchases field.';
                }
                field("Gift Tolerance Qty"; Rec."Gift Tolerance Qty")
                {
                    ToolTip = 'Specifies the value of the Gift Tolerance Quantity for Sales field.';
                }
            }
        }
    }
}

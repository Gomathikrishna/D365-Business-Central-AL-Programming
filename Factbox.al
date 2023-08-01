page 50100 "Exploring Factbox"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;

                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; "Item Picture")
            {
                ApplicationArea = all;
            }
            part(KPI; "Acc. Sched. KPI Web Srv. Lines")
            {
                ApplicationArea = all;
                SubPageView = sorting("Acc. Schedule Name");
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = all;
            }
            systempart(Links; Links)
            {
                ApplicationArea = all;
            }

        }
    }


}
page 50112 "Television Show List"
{
    PageType = List;
    SourceTable = "Television Show";
    ApplicationArea = Basic;
    UsageCategory = Lists;
    CardPageId = "TTelevision Show Card";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.") { ApplicationArea = Basic; }
                field("Television Type"; "Television Show Type") { ApplicationArea = Basic; }
                field("Name"; "Name") { ApplicationArea = Basic; }
                field("Run Time"; "Run Time") { ApplicationArea = Basic; }
                field("Host Code"; "Host Code") { ApplicationArea = Basic; }
                field("Host Name"; "Host Name") { ApplicationArea = Basic; }
                field("Average Listeners"; "Average Listeners") { ApplicationArea = Basic; }
                field("Audience Share"; "Audience Share") { ApplicationArea = Basic; }
                field("Advertising Revenue"; "Advertising Revenue") { ApplicationArea = Basic; }
                field("Royalty Cost"; "Royalty Cost") { ApplicationArea = Basic; }

            }

        }
        area(FactBoxes)
        {
            part(Fans; "Televsion Show Fan Factbox")
            {
                ApplicationArea = Basic;
                SubPageLink = "Television Show No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(s)
            {
                action(x)
                {

                }
            }

        }
    }
}
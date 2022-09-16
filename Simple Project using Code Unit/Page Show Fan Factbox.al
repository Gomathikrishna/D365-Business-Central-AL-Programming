page 50113 "Televsion Show Fan Factbox"
{
    PageType = ListPart;
    SourceTable = "Television Show Fan";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Name; Name) { ApplicationArea = Basic; }
                field("E-Mail"; "E-Mail") { ApplicationArea = Basic; }
                field("Last Contacted"; "Last Contacted") { ApplicationArea = Basic; }
            }
        }
    }
}
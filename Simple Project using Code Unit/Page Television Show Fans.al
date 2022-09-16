page 50111 "Television Show Fans"
{
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = Basic;
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
page 50102 "Television Show Type"
{
    PageType = List;
    SourceTable = "Television Show Type";
    ApplicationArea = Basic;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { ApplicationArea = Basic; }
                field(Description; Rec.Description) { ApplicationArea = Basic; }
            }
        }
    }
}
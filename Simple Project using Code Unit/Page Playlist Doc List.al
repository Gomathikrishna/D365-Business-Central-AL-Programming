page 50103 "Playlist Document List"
{
    PageType = List;
    SourceTable = "Playlist Header";
    ApplicationArea = Basic;
    UsageCategory = Documents;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = Basic; }
                field(Description; Rec.Description) { ApplicationArea = Basic; }
                field("Radio Show No."; Rec."Television Show No.") { ApplicationArea = Basic; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = Basic; }
                field("End Time"; Rec."End Time") { ApplicationArea = Basic; }
                field("Broadcast Date"; Rec."Broadcast Date") { ApplicationArea = Basic; }
                field(Duration; Rec.Duration) { ApplicationArea = Basic; }
            }
        }
    }
}
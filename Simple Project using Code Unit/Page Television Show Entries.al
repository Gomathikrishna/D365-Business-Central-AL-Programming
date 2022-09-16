page 50106 "Television Show Entries"
{
    PageType = List;
    SourceTable = "Television Show Entry";
    UsageCategory = History;
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Television Show No."; Rec."Television Show No.") { ApplicationArea = Basic; }
                field(Description; Rec.Description) { ApplicationArea = Basic; }
                field(Duration; Rec.Duration) { ApplicationArea = Basic; }
                field(Date; Rec.Date) { ApplicationArea = Basic; }
                field(Time; Rec.Time) { ApplicationArea = Basic; }
                field("Fee Amount"; Rec."Fee Amount") { ApplicationArea = Basic; }
                field("Publisher Code"; Rec."Publisher Code") { ApplicationArea = Basic; }
                field("Entry No."; Rec."Entry No.") { ApplicationArea = Basic; }
            }
        }


    }

}
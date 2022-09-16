page 50107 "Listerner Entries"
{
    PageType = List;
    SourceTable = "Listerner Entry";
    ApplicationArea = Basic;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Television Show No."; Rec."Television Show No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date) { ApplicationArea = Basic; }
                field("Age Demographic"; Rec."Age Demographic") { ApplicationArea = Basic; }
                field("Audience Share"; Rec."Audience Share") { ApplicationArea = Basic; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = Basic; }
                field("End Time"; Rec."End Time") { ApplicationArea = Basic; }
                field("Ratings Source Entry No."; Rec."Ratings Source Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }

    }


}
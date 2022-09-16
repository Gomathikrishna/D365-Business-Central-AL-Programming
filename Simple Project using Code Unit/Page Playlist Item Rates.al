page 50105 "Playlist Item Rates"
{
    PageType = List;
    SourceTable = "Playlist Item Rate";
    ApplicationArea = Basic;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.") { ApplicationArea = Basic; }
                field("Publisher Code"; Rec."Publisher Code") { ApplicationArea = Basic; }
                field("Rate Amount"; Rec."Rate Amount") { ApplicationArea = Basic; }
                field("Source Type"; Rec."Source Type") { ApplicationArea = Basic; }
                field("Source No."; Rec."Source No.") { ApplicationArea = Basic; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = Basic; }
                field("End Time"; Rec."End Time") { ApplicationArea = Basic; }
            }
        }
    }
}
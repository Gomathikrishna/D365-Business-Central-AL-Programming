table 50104 "Playlist Item Rate"
{
    fields
    {
        field(1; "Source Type"; Option) { OptionMembers = Vendor,Customer; }
        field(2; "Source No."; Code[20])
        {

            TableRelation = IF ("Source Type" = const(Vendor)) Vendor."No."
            ELSE
            IF ("Source Type" = const(Customer)) Customer."No.";

        }
        field(30; "Item No."; Code[20]) { }
        field(40; "Start Time"; Time) { }
        field(50; "End Time"; Time) { }
        field(60; "Rate Amount"; Decimal) { }
        field(70; "Publisher Code"; Code[10]) { }
    }
}
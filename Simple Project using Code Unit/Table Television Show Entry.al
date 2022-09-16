table 50105 "Television Show Entry"
{
    fields
    {
        field(1; "Entry No."; Integer) { }
        field(10; "Television Show No."; Code[20]) { }
        field(20; Type; Option) { OptionMembers = ,Resource,Show,Item; }
        field(30; "No."; Code[20]) { }
        field(40; "Data Format"; Option) { OptionMembers = ,Vinyl,CD,MP3,PSA,Advertisement; }
        field(50; Description; Text[50]) { }
        field(60; Date; Date) { }
        field(70; Time; Time) { }
        field(80; Duration; Duration) { }
        field(90; "Fee Amount"; Decimal) { }
        field(100; "ACSAP ID"; Integer) { }
        field(120; "Publisher Code"; Code[10]) { }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(Reporting; "Television Show No.", Date) { SumIndexFields = "Fee Amount"; }
        key(Reporting2; Type, "No.", Date) { SumIndexFields = "Fee Amount"; }
    }
}
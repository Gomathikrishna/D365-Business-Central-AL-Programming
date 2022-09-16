table 50100 "Television Show"
{

    fields
    {
        field(1; "No."; Code[20]) { }
        field(10; "Television Show Type"; Code[10]) { TableRelation = "Television Show Type"; }
        field(20; "Name"; Text[50]) { }
        field(40; "Run Time"; Duration) { }
        field(50; "Host Code"; Code[20]) { }
        field(60; "Host Name"; Text[50]) { }
        field(100; "Average Listeners"; Decimal) { }
        field(110; "Audience Share"; Decimal) { }
        field(120; "Advertising Revenue"; Decimal) { }
        field(130; "Royalty Cost"; Decimal) { }
        field(1000; Frequency; Option) { OptionMembers = Hourly,Daily,Weekly,Monthly; }
        field(1010; "PSA Planned Quantity"; Integer) { }
        field(1020; "Ads Planned Quantity"; Integer) { }
        field(1030; "News Required"; Boolean) { InitValue = true; }
        field(1040; "News Duration"; Duration) { }
        field(1050; "Sports Required"; Boolean) { InitValue = true; }
        field(1060; "Sports Duration"; Duration) { }
        field(1070; "Weather Required"; Boolean) { InitValue = true; }
        field(1080; "Weather Duration"; Duration) { }
        field(1090; "Date Filter"; Date) { FieldClass = FlowFilter; }
    }
    keys
    {
        key(PK; "No.") { }
        key(Name; Name) { }
        key(HostName; "Host Name") { }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Host Name") { }
        fieldgroup(Brick; "No.", Name, "Audience Share") { }
    }
    trigger OnDelete()
    var
        x: page 9006;
    begin

    end;
}
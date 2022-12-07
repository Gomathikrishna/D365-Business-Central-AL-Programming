pageextension 50108 setloadfields extends "Item List"
{

    trigger OnOpenPage()

    var
        item: Record Item;
        total: Decimal;
        cnt: Integer;

    begin
        Item.SetLoadFields(Item."Unit Cost");
        if item.FindSet() then begin
            repeat
                total += item."Unit Cost";
                cnt += 1;
            until item.Next() = 0;
            Message(Format(total / cnt));
        end;
    end;
}
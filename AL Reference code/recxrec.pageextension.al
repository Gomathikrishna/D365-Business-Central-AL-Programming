//Rec & xRec
//a=5; a++ Rec Xrec
//address 23 Rec, 24 Rec=24, Xrec=23
pageextension 50102 recxrec extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()
    begin
        Message('On open page (Rec), the address is: %1', Rec.Address);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Message('On modify, the address is (Rec): %1', Rec.Address);
        Message('On modify, the previous address is (xRec) : %1', xRec.Address);
    end;

    var
        myInt: Integer;
}
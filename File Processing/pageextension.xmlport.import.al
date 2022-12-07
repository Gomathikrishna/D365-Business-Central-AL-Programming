pageextension 50100 ExtendItemList extends "Item List"
{
    actions
    {
        addafter(History)
        {
            action(ImportItems)
            {
                Caption = 'Import Items';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(50101, false, true);
                end;
            }
        }
    }
}
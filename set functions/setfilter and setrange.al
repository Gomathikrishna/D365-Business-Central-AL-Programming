pageextension 50103 "Setfilterandrange" extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action("Setfilter")
            {
                ApplicationArea = all;
                Caption = 'Set filter';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetFilter("No.", '1003');
                end;
            }
            action("SetRange")
            {
                ApplicationArea = all;
                Caption = ' Set Range';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("Unit Price", 5000, 15000);
                end;
            }

        }
    } 
} 

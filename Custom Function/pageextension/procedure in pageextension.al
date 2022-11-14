pageextension 50112 CustomerPageExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Shoesize; Rec.Shoesize)
            {
                ApplicationArea = All;
                Caption = 'Shoe Size';

                trigger OnValidate()
                begin
                    CalculateSiize();
                end;
            }

            field(remshoes; Rec.remshoes)
            {
                Caption = 'Remaining Shoes';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    CalculateStock();
                end;
            }
        }
    }
    local procedure CalculateSiize()
    begin
        if (Rec.Shoesize < 5) then
            Error('The size is too small')
        else
            Message('Saved successully');
    end;

    local procedure CalculateStock()

    begin
        if (Rec.remshoes < 3) then
            Message('Refill the stock');
    end;

}




tableextension 50112 CustomerTableExtension extends Customer
{
    fields
    {
        field(50100; Shoesize; Integer)
        {


        }
        field(50101; remshoes; Integer) { }
    }


}

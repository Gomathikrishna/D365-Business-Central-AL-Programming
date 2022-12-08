pageextension 50105 MyExtension extends "Item List"
{
    trigger OnOpenPage()
    begin

        if Cust.Get('1003')
        then begin
            Message(Text000);
            Cust.SetFilter("No.", '1003');
        end
        else
            Message(Text001);

    end;

    var
        Cust: Record Customer;
        Text000: Label 'Record Found';
        Text001: Label 'Record Not Found';
}
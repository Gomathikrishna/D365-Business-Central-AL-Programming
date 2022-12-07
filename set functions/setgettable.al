page 50110 setgettable
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    actions
    {
        area(Processing)
        {
            action(setgettable)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Invent.FIND('-');
                    RecID := Invent."Source Line ID";
                    RecRef := RecID.GETRECORD;
                    //SetTable => Sets the table to which a Record variable refers as the same table as a RecordRef variable.
                    RecRef.SETTABLE(prodorder);


                end;
            }
            action(gettable)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    recref.GetTable(prodorder);
                    Message('The table used to get set %1', prodorder);

                end;
            }
            action(setselectionfilter)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MESSAGE(FORMAT(custom.COUNT));
                    CurrPage.SETSELECTIONFILTER(custom);
                    MESSAGE(FORMAT(custom.COUNT));

                end;
            }

        }
    }

    var
        Invent: Record "Inventory Event Buffer";
        recid: RecordId; //RecordID Contains the table number and the primary key of a table.We can use two methods=> GetRecord(), TableNo()
        recref: RecordRef;// RecordRef => The RecordRef object can refer to any table in the database. 
        prodorder: Record "Prod. Order Component"; //Record => Complex data type

        custom: Record Customer;
}
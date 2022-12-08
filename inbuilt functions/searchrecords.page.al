//Search functions
//get, find, Next
//Get => PK fields

pageextension 50106 searchfunctions extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action("Get Function")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Cust.Get('1120') then
                        Message(Text001)
                    else
                        Message(Text002);
                end;
            }
            //+ find the last record in the table
            //- first record in the table
            action("Find funtion")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Cust."No." := '10000';
                    if Cust.Find('=') then
                        Message(Text003, Cust."No.", Cust.Name, Cust."Address 2")
                    else
                        Message(Text002);
                end;
            }
            //Next function
            //>0 - Forward search
            //<0 - backward search
            // =0 - stay on the same record
            action("Next Function")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    count := 0;
                    Cust."No." := '120';
                    if Cust.Find('-') then begin
                        repeat
                            count := count + 1
                        until Cust.Next = 0;
                        Message(Text001);
                    end
                    else
                        Message(Text002);
                end;
            }



        }

    }

    var
        Cust: Record Customer;
        Text001: Label 'Record Found';
        Text002: Label 'Record Not found';

        Text003: Label 'Record Found: Customer Number: %1, \Customer Name: %2 and \Customer Address: %3';
        count: Integer;
}
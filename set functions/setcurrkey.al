page 50109 setgetfunctions
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(setcurrentkey)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF Customer.SetCurrentKey("Salesperson Code") THEN
                        MESSAGE(Text001)
                    ELSE
                        MESSAGE(Text002);
                end;

            }


            action(setposition)
            {
                ApplicationArea = All;


                trigger OnAction()
                begin
                    InputString := 'No.=Const(20001)';
                    MyRecordRef.Open(23);
                    MyFieldRef := MyRecordRef.Field(1);
                    MyFieldRef.SetFilter('10000..20000');
                    MyRecordRef.FindLast;
                    Message(Text004, MyRecordRef.RecordId, MyRecordRef.Field(2));
                    MyRecordRef.SetPosition(InputString);
                    Message(Text005, MyRecordRef.RecordId, MyRecordRef.Field(2));
                    InputString := MyRecordRef.GetPosition(true);
                    Message(Text003, InputString);

                end;

            }

        }
    }

    var
        Customer: Record Customer;
        Text001: Label 'Key selected successfully';
        Text002: Label 'Key not found';
        RecRef: RecordRef;
        varPrimaryKey: Text;
        Text003: Label 'The primary key is: %1';

        //Setposition
        MyRecordRef: RecordRef;
        InputString: Text;
        MyFieldRef: FieldRef;
        Text004: Label 'The record No. before the primary key was changed is %1.\\ The vendor name before the primary key was changed is %2.';
        Text005: Label 'The record No. after the primary key was changed is %1. \\ The vendor name after the primary key was changed is %2';


}
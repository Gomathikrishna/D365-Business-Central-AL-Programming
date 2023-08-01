page 50111 "Complex data type"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(Collections)
            {
                field(SalesAmount; SalesAmount[3])
                {
                    ApplicationArea = All;
                    Caption = 'Integer Array';
                }

                field(SalesPerson; SalesPerson[3])
                {
                    ApplicationArea = All;
                    Caption = 'String Array';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Dialog")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    MyDialog: Dialog;
                    MyNext: Integer;
                    Text000: Label 'Counting to 4 #1:';
                begin
                    MyNext := 0;
                    MyDialog.Open(Text000, MyNext);

                    repeat
                        // Do some processing.  
                        Sleep(1000);
                        MyNext := MyNext + 1;
                        MyDialog.Update(); // Update the field in the dialog.  

                    until MyNext = 4;
                    Sleep(1000);
                    MyDialog.Close();
                end;
            }

            action("Record Ref")
            {
                trigger OnAction()
                Var
                    recref: RecordRef;
                begin
                    recref.Open(Database::Customer);
                    recref.FindFirst();
                    Message(Format(recref.Field(1).Caption));
                end;
            }

            action("GUIDD")
            {
                trigger OnAction()
                begin

                    gid := CreateGuid();
                    Message(gid);
                end;
            }
        }
    }

    var
        largeText: BigText;
        filee: Codeunit "File Management";

        fil: File;
        fieldre: FieldRef;
        gid: Guid;
        istream: InStream;
        ostream: OutStream;

        kref: KeyRef;
        cuspag: Page "Customer Card";
        quer: Query "My Customers";

        recor: Record Customer;

        recrid: RecordId;

        rep: Report "Customer Register";

        sys: Variant;

        SalesAmount: array[3] of Integer;

        SalesPerson: array[3] of Text[25];

        Custname: List of [Text];

        country: Dictionary of [Code[10], List of [Text]];


}


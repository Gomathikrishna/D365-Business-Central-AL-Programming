page 50119 XMLTest
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'XML Import Data';



    actions
    {

        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Caption = 'Import XML Data';
                trigger OnAction()
                var
                    Testxml: Codeunit XMLImport;
                begin
                    Testxml.ImportData();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
page 50108 Operator
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;



    actions
    {
        area(Processing)
        {
            action(ProgressWindow)
            {
                ApplicationArea = All;
                Caption = 'Progress Window';
                Image = Action;
                trigger OnAction()
                var
                    ProgressWindow: Dialog;
                    Cnt: Integer;
                    Messg: Label 'Processing...#1';
                begin

                    if not GuiAllowed then
                        exit;
                    ProgressWindow.Open(Messg);
                    for Cnt := 0 to 100 do begin
                        ProgressWindow.Update(1, Cnt);
                        Sleep(70);
                    end;
                    ProgressWindow.Close();

                end;
            }
        }
    }





}
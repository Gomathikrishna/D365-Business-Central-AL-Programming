page 50117 "Date Functions"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    // layout
    // {
    //     area(Content)
    //     {
    //         group(GroupName)
    //         {
    //             field(Name; NameSource)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }

    trigger OnOpenPage()
    var
        DateMessage: Label 'Today date is: %1';
        Now: Label 'Current Time: %1';
        CurrentTime: Time;
    begin
        Message(DateMessage, Today);
        Message(Now, CurrentTime);
    end;
}
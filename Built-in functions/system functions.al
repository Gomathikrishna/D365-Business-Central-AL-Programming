page 50122 "System Functions"

{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(userid)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message(Msg, UserId);

                end;
            }

            action(usersecurityid)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message(Msg1, UserSecurityId());
                end;
            }

            action(Today)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message(todayda, Today);
                end;
            }
            action(workdate)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message(wdate, WorkDate());
                end;
            }
            action(timee)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message(timee, Time);
                end;
            }
        }
    }

    var
        Msg: Label 'User ID is ''%1''';
        Msg1: Label ' User Security ID is ''%1''';
        wdate: Label ' Workdate is ''%1''';
        todayda: Label ' Todays date is ''%1''';
        timee: Label ' Time is ''%1''';




}
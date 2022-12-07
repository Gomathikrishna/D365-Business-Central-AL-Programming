page 50117 "String functions"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field(MyString; MyString)
                {
                    ApplicationArea = All;


                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Split Text")
            {
                ApplicationArea = All;

                trigger OnAction()

                begin



                end;
            }
        }
    }

    var
        MyString: Text[100];
    // SuccMsg: Label 'Text converted';
    // FailMsg: Label 'Check your code again';
    // MyList: List of [Text];





}
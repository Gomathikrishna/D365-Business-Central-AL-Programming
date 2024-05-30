page 50106 "MyListofPageProperties"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    CaptionML = ENU = 'NAME', DAN = 'Navn', DEU = 'Name', FRA = 'Nom';
    //Multilingual Support, Dynamic Language switching, Compliance with localization
    CardPageId = 50106; //list page or list part page
    //to provide users with detailed view, enhance user expereience
    DeleteAllowed = false;
    //pages, request page, data management
    //sensitive data, work flow, read only page, compliance auditing 
    Editable = false;
    //make it false - To display the field and not to edit
    HelpLink = 'http://www.microsoft.com';



    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(myInt; myInt)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}
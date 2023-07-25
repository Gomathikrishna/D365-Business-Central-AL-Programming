page 50123 ListFunctions
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    actions
    {
        area(Processing)
        {
            action(addfunction)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myIntegerList: List of [Integer];
                    integeritem: Integer;
                begin
                    myIntegerList.Add(2);
                    myIntegerList.Add(25);
                    myIntegerList.Add(21);
                    foreach integeritem in myIntegerList do
                        Message('The integer list added is %1', integeritem);
                end;
            }

            action(contains)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myIntegerList: List of [Integer];
                    exists: Boolean;
                begin
                    myIntegerList.Add(2);
                    myIntegerList.Add(25);
                    myIntegerList.Add(21);
                    exists := myIntegerList.Contains(25);
                    Message('%1', exists);
                    exists := myIntegerList.Contains(3);
                    Message('%1', exists);
                end;
            }
            action(setindex)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myTextList: List of [Text];
                    textin: Text;
                begin
                    myTextList.Add('Business');
                    myTextList.Add('Central');
                    myTextList.Add('AL Programming');
                    myTextList.Set(1, 'Microsoft');
                    Message('The value is set in the specified index');
                    textin := myTextList.Get(1);
                    Message('The Text list added is %1', textin);
                end;
            }

            action(insert)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myTextList: List of [Text];
                    textin: Text;
                begin
                    myTextList.Add('Business');
                    myTextList.Add('Central');
                    myTextList.Add('AL Programming');
                    Message('Before insert');
                    foreach textin in myTextList do
                        Message('The data is %1', textin);
                    Message('After insert');
                    myTextList.Insert(1, 'Microsoft');
                    foreach textin in myTextList do
                        Message('The data is %1', textin);

                end;
            }
            action(addrange)
            {
                ApplicationArea = All;
                trigger OnAction()

                var
                    myTextList: List of [Text];
                    textin: Text;
                begin
                    myTextList.AddRange('Microsoft', 'Dynamics', '365', 'Business', 'Central');
                    foreach textin in myTextList do
                        Message('%1', textin);

                end;
            }
        }
    }

    var
        x: Integer;

}
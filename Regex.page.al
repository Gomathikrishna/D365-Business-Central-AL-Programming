page 50107 RegExValidation
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
                field(EmpID; EmpID)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        Pattern := '[A-Z]{3}\-[0-9,A-Z]{3}';
                        if regex.IsMatch(EmpID, Pattern, 0) then
                            Message('Match')
                        else
                            Error('Please enter the valid input');
                    end;

                }
                field(email; email)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        Pattern := '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
                        if regex.IsMatch(email, Pattern, 0)
                        then
                            Message('Matched')
                        else
                            Error('INvalid input');

                    end;
                }
            }
        }
    }


    var
        EmpID: Text[30];
        regex: Codeunit Regex;
        Pattern: Text;
        email: Text[70];
}
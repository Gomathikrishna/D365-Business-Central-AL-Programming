page 50102 "Employeee list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Employeee;

    layout
    {
        area(Content)
        {
            group("Basic Info")
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Employee Number';
                    Editable = true;

                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Employee Name';
                    Editable = true;
                }
                field("blood group"; Rec."blood group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Blood group';
                    Editable = true;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'DOB';
                    Editable = true;
                }
            }
            group("Contact Info")
            {
                field("Door No"; Rec."Door No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Door No';
                    Editable = true;
                }
                field("Street Name"; Rec."Street Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Street Name';
                    Editable = true;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'City';
                    Editable = true;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                    ToolTip = 'State';
                    Editable = true;
                }

                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Country';
                    Editable = true;
                }
            }

            group("General Info")
            {
                field("Date of joining"; Rec."Date of joining")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date of joining';
                    Editable = true;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Employee Departmenr';
                    Editable = true;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Employee Designaition';
                    Editable = true;
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


}
//onvalidate, if, error(), mandatory field
table 50101 "Employeee"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {

            trigger OnValidate()
            begin
                if (Rec."Employee No" < '100') then
                    Error('Employee number should be greater than 100');
            end;
        }
        field(10; "Employee Name"; Text[30]) { }
        field(20; "Door No"; Text[10])
        {

        }
        field(40; "Street Name"; Text[15]) { }
        field(50; "City"; Text[15])
        {

        }
        field(60; "State"; Option)
        {
            OptionMembers = "Tamilnadu","Karnataka","Kerala","Telangana";
        }
        field(70; "Country"; Option)
        {
            OptionMembers = "India";

        }

        field(100; "Date of Birth"; Date) { }
        field(110; "Date of joining"; Date) { }
        field(120; "Department"; Text[15]) { }
        field(130; "Designation"; Option)
        {
            OptionMembers = "Jr Programmer","Sr Programmer","Team lead","Manager","Sr Manager";
        }
        field(140; "blood group"; Text[3])
        {

        }
        field(150; Salary; Decimal)
        {

        }

    }


    keys
    {
        key(PK; "Employee No") { }
        key(Name; "Employee Name") { }


    }




}
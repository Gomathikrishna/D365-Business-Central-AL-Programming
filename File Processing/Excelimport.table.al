table 50114 "GS Excel Import Buffer"
{
    Caption = 'GS Excel Import Buffer';

    fields
    {
        field(1; "Transaction Name"; Code[10])
        {
            Caption = 'Transaction Name';
            DataClassification = CustomerContent;

        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Integer';
            DataClassification = CustomerContent;

        }
        field(3; "File Name"; Text[50])
        {
            Caption = 'File Name';
            DataClassification = CustomerContent;

        }
        field(4; "Sheet Name"; Text[50])
        {
            Caption = 'Sheet Name';
            DataClassification = CustomerContent;

        }
        field(5; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(6; "Time Imported"; Time)
        {
            Caption = 'Imported Time';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(7; "Customer-No."; Code[30])
        {
            Caption = 'Customer No';
            DataClassification = CustomerContent;

        }
        field(8; "Product No."; Code[10])
        {
            Caption = 'Product No';
            DataClassification = CustomerContent;

        }
        field(9; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;

        }
        field(10; Type; Enum "Sales Line Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;

        }
        field(11; "Payment Method"; Text[10])
        {
            Caption = 'Payment Method';
            DataClassification = CustomerContent;

        }
        field(12; "Quantity"; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

        }
        field(13; "Unit Price"; Integer)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(Key1; "Transaction Name", "Line No.")
        {
            Clustered = true;
        }
    }


}
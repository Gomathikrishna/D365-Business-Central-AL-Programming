tableextension 50115 "Brand Name" extends "Item"
{
    DataCaptionFields = "No.", Description;
    fields
    {
        field(50105; "Brand Name"; Text[250])
        {
            Caption = 'Brand Name';
            Description = 'It is a code and description';
            Editable = true;
            TableRelation = Item."Brand Name";
            DataClassification = ToBeClassified;


        }
    }
}



pageextension 50115 ItemBrandPageExt extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Brand Name"; Rec."Brand Name")
            {
                ApplicationArea = All;
                Caption = 'Brand Name';
                ToolTip = 'It is code and description';
            }

        }

    }
}




query 50115 ItemBrandQuery
{
    Caption = 'ItemBrandQuery';
    QueryType = Normal;
    QueryCategory = 'Item';

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
                Caption = 'Code';
            }
            column(Description; Description)
            {
                Caption = 'Description';
            }
        }
    }

    trigger OnBeforeOpen()
    begin
    end;
}


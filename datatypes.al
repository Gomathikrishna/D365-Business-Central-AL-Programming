page 50110 DataTypesCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Data Types Card';

    layout
    {
        area(Content)
        {
            group("Fundamental Variables - Numeric Data Type")
            {

                field(LoopNo; LoopNo)
                {
                    ApplicationArea = all;
                    Caption = 'Integer';

                }
                field(bigin; bigin)
                {
                    ApplicationArea = all;
                    Caption = 'Big Integer';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = all;
                    Caption = 'Amount in Decimal';
                    DecimalPlaces = 3;

                }
                field(Color; Color)
                {
                    ApplicationArea = all;
                    Caption = 'Color in Option';
                }
                field(Ch; Ch)
                {
                    ApplicationArea = all;
                    Caption = 'Char';
                }
                field(byt; byt)
                {
                    ApplicationArea = all;
                    Caption = 'Byte';
                }
                field(durati; durati)
                {
                    ApplicationArea = all;
                    Caption = 'Duration';
                }
            }
            group("fundamental Variable - String ")
            {
                field(Description; Description)
                {
                    ApplicationArea = all;
                    Caption = 'Description in Text ';
                }
                field("Code Number"; "Code Number")
                {
                    ApplicationArea = all;
                    Caption = 'Code Number in Code';
                }

            }

            group("fundamental variables - Other")
            {
                field(YesOrNo; YesOrNo)
                {
                    ApplicationArea = all;
                    Caption = 'Yes or no in Boolean';
                }
                field("When Was It"; "When Was It")
                {
                    ApplicationArea = all;
                    Caption = 'Date';
                }
                field("What Time"; "What Time")
                {
                    ApplicationArea = all;
                    Caption = 'Time';
                }
                field("when and what"; "when and what")
                {
                    ApplicationArea = all;
                    Caption = 'Date and Time';
                }
            }

        }

    }

    actions
    {
        area(Processing)
        {

        }
    }

    var
        //Fundamental variables
        LoopNo: Integer;
        bigin: BigInteger;
        Amount: Decimal;
        Color: Option Red,Orange,Yellow,Green,Blue,Violet;
        Ch: Char;
        byt: Byte;
        durati: Duration;
        YesOrNo: Boolean;
        "When Was It": Date;
        "What Time": Time;
        "when and what": DateTime;
        Description: Text[30];
        "Code Number": Code[10];

    //Complex Variables




}
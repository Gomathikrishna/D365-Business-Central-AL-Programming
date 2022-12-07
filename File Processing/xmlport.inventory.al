xmlport 50116 "InventoryItems"
{
    //XMLPORT 50140 - InventoryItems  (load Inventory Items in Tbbl 83 - Item Journal + Lots No.)
    Direction = Import;
    FieldDelimiter = '<None>';  //NONE Delimiter  (for TEXT FILE)
    FieldSeparator = '<TAB>';   //TAB separator   (for TEXT FILE)
    Format = VariableText;
    Permissions = TableData "Item Journal Line" = rimd,
                  TableData "Tracking Specification" = rimd,
                  TableData "Reservation Entry" = rimd,
                  TableData "Lot No. Information" = rimd;

    schema
    {
        textelement(DocumentElement)
        {
            tableelement("Item Journal Line"; "Item Journal Line")
            {
                AutoReplace = false;
                AutoUpdate = true;
                XmlName = 'ROOT';
                fieldelement(NrRiga; "Item Journal Line"."Line No.")
                {
                    FieldValidate = no;
                }
                fieldelement(Articolo; "Item Journal Line"."Item No.")
                {
                }
                fieldelement(Magazzino; "Item Journal Line"."Location Code")
                {
                    FieldValidate = no;
                }
                fieldelement(collocazione; "Item Journal Line"."Bin Code")
                {
                }
                fieldelement(quantita; "Item Journal Line".Quantity)
                {
                    FieldValidate = yes;
                }
                fieldelement(data; "Item Journal Line"."Posting Date")
                {
                }
                fieldelement(UM; "Item Journal Line"."Unit of Measure Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(costoUnitario; "Item Journal Line"."Unit Amount")
                {
                    MinOccurs = Zero;
                }
                textelement(lottoinput)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    riga := riga * +10000;

                    //Assign Lot No. Tracking
                    riga := riga + 1;
                    if lottoinput <> '' then begin
                        ReservationEntry."Entry No." := riga;
                        ReservationEntry.Positive := true;
                        ReservationEntry."Item No." := "Item Journal Line"."Item No.";
                        ReservationEntry."Location Code" := "Item Journal Line"."Location Code";
                        ReservationEntry.Validate("Quantity (Base)", "Item Journal Line".Quantity);
                        ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Prospect;
                        ReservationEntry."Creation Date" := WorkDate;
                        ReservationEntry."Source Type" := 83;
                        ReservationEntry."Source Subtype" := 2;
                        ReservationEntry."Source ID" := 'ARTICOLO';  //Item
                        ReservationEntry."Source Batch Name" := 'GIA INI'; //Natch
                        ReservationEntry."Source Ref. No." := "Item Journal Line"."Line No.";
                        ReservationEntry."Qty. per Unit of Measure" := 1;
                        ReservationEntry."Lot No." := lottoinput;
                        ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Lot No.";
                        ReservationEntry.Insert;

                        //Lot No. Info table
                        LotNoInformation.SetRange(LotNoInformation."Item No.", "Item Journal Line"."Item No.");
                        LotNoInformation.SetRange(LotNoInformation."Lot No.", lottoinput);

                        if not LotNoInformation.FindSet then begin
                            LotNoInformation."Item No." := "Item Journal Line"."Item No.";
                            LotNoInformation."Lot No." := lottoinput;
                            LotNoInformation.Description := lottoinput;
                            LotNoInformation.Insert;
                        end
                    end;
                end;

                trigger OnBeforeInsertRecord()
                begin

                    "Item Journal Line"."Journal Template Name" := 'ARTICOLO';  //Item
                    //"Item Journal Line"."Unit of Measure Code" := ItemUnitofMeasure.Code;  //UMIS
                    "Item Journal Line"."Journal Batch Name" := 'GIA INI';
                    "Item Journal Line"."Document No." := 'GIA INI';
                    "Item Journal Line"."Reason Code" := 'GIA INI';
                    "Item Journal Line"."Bin Code" := 'DISP';
                    "Item Journal Line"."Entry Type" := "Item Journal Line"."Entry Type"::"Positive Adjmt.";
                    //ADD Validate if you need                
                end;

                trigger OnBeforeModifyRecord()
                begin
                    "Item Journal Line"."Document No." := 'GIA INI';  //Default INV Doc
                    "Item Journal Line"."Reason Code" := 'GIA INI';   //Default Reason Code
                end;
            }
        }
    }



    trigger OnPreXmlPort()
    begin
        riga := 1;
    end;

    var
        ItemUnitofMeasure: Record "Item Unit of Measure";
        recItem: Record Item;
        ReservationEntry: Record "Reservation Entry";
        riga: Integer;
        LotNoInformation: Record "Lot No. Information";
}

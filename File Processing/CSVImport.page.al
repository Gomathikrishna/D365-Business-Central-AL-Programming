page 50115 "GS CSV Import"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "GS CSV Import Buffer";
    AutoSplitKey = true;
    Caption = 'GS CSV Import';
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    SaveValues = true;
    SourceTableView = sorting("Transaction Name", "Line No.");


    layout
    {
        area(Content)
        {
            field(TransName; TransName)
            {
                Caption = 'Transaction Name';
                ApplicationArea = All;
            }
            repeater(Group)
            {
                Editable = false;
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Product No."; Rec."Product No.")
                {

                    ApplicationArea = All;
                }
                field("Customer-No."; Rec."Customer-No.")
                {

                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {

                    ApplicationArea = All;
                }
                field("Payment Method"; Rec."Payment Method")
                {

                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {

                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
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
            action("&Import")
            {
                ApplicationArea = All;
                Caption = '&Import';
                Image = ImportDatabase;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Import data from CSV';

                trigger OnAction()
                begin
                    if TransName = '' then
                        Error(BatchIsblankmsg);
                    ReadCSVdata();
                    ImportCSVData();

                end;
            }
        }
    }
    var
        TransName: Code[10];
        FileName: Text[100];
        TempCSVBuffer: Record "CSV Buffer" temporary;
        UploadMsg: Label 'Please choose the CSV file';
        NoFileMsg: Label 'No CSV file found';
        BatchIsblankmsg: Label 'Trasaction name is blank';
        CSVImportSuccess: Label 'CSV imported successfully';




    local procedure ReadCSVdata()
    var
        FileManagent: Codeunit "File Management";
        Istream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Istream);
        if FromFile <> '' then begin
            FileName := FileManagent.GetFileName(FromFile);
        end else
            Error(NoFileMsg);
        TempCSVBuffer.Reset();
        TempCSVBuffer.DeleteAll();
        TempCSVBuffer.LoadDataFromStream(Istream, ',');
        TempCSVBuffer.GetNumberOfLines();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text

    begin
        TempCSVBuffer.Reset();
        if TempCSVBuffer.Get(RowNo, ColNo) then
            exit(TempCSVBuffer.Value)
        else
            exit('');
    end;


    local procedure ImportCSVData()
    var
        GSImportBuffer: Record "GS CSV Import Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNO: Integer;
        MaxRow: Integer;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRow := 0;
        LineNO := 0;
        GSImportBuffer.Reset();
        if GSImportBuffer.FindLast() then
            LineNO := GSImportBuffer."Line No.";
        TempCSVBuffer.Reset();
        if TempCSVBuffer.FindLast() then begin
            MaxRow := TempCSVBuffer."Line No.";
        end;
        for RowNo := 2 to MaxRow do begin
            LineNO := LineNO + 10000;
            GSImportBuffer.Init();
            Evaluate(GSImportBuffer."Transaction Name", TransName);
            GSImportBuffer."Line No." := LineNO;
            Evaluate(GSImportBuffer."Product No.", GetValueAtCell(RowNo, 1));
            Evaluate(GSImportBuffer."Customer-No.", GetValueAtCell(RowNo, 2));
            Evaluate(GSImportBuffer.Date, GetValueAtCell(RowNo, 3));
            Evaluate(GSImportBuffer."Payment Method", GetValueAtCell(RowNo, 4));
            Evaluate(GSImportBuffer.Quantity, GetValueAtCell(RowNo, 5));
            Evaluate(GSImportBuffer."Unit Price", GetValueAtCell(RowNo, 6));
            GSImportBuffer.Insert();
        end;
        Message(CSVImportSuccess);
    end;
}



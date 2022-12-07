page 50114 "GS Excel Import and Export"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "GS Excel Import Buffer";
    AutoSplitKey = true;
    Caption = 'GS Excel Buffer Import and Export';
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
                field(Type; Rec.Type)
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
                field("File Name"; Rec."File Name")
                {

                    ApplicationArea = All;
                }
                field("Sheet Name"; Rec."Sheet Name")
                {

                    ApplicationArea = All;
                }
                field("Imported Date"; Rec."Imported Date")
                {

                    ApplicationArea = All;
                }
                field("Time Imported"; Rec."Time Imported")
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
            action("Import to BC")
            {
                ApplicationArea = All;
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Import data from excel';

                trigger OnAction()
                begin
                    if TransName = '' then
                        Error(BatchIsblankmsg);
                    ReadExcelSheet();
                    ImportExcelData();

                end;
            }

            action("Export To Excel")
            {
                Caption = 'Export to Excel';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Export;

                trigger OnAction()
                var
                begin
                    ExportExcelEntries(Rec);
                end;
            }
        }
    }

    var
        TransName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadMsg: Label 'Please choose the Excel file';
        NoFileMsg: Label 'No Excel file found';
        BatchIsblankmsg: Label 'Trasaction name is blank';
        ExcelImportSuccess: Label 'Excel imported successfully';

    local procedure ReadExcelSheet()
    var
        FileManagent: Codeunit "File Management";
        Istream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Istream);
        if FromFile <> '' then begin
            FileName := FileManagent.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(Istream);

        end else
            Error(NoFileMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(Istream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text

    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure ImportExcelData()
    var
        GSImportBuffer: Record "GS Excel Import Buffer";
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
        TempExcelBuffer.Reset();

        if TempExcelBuffer.FindLast() then begin
            MaxRow := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRow do begin
            LineNO := LineNO + 10000;

            GSImportBuffer.Init();
            Evaluate(GSImportBuffer."Transaction Name", TransName);
            GSImportBuffer."Line No." := LineNO;
            Evaluate(GSImportBuffer."Product No.", GetValueAtCell(RowNo, 1));
            Evaluate(GSImportBuffer."Customer-No.", GetValueAtCell(RowNo, 2));
            Evaluate(GSImportBuffer.Date, GetValueAtCell(RowNo, 3));
            Evaluate(GSImportBuffer.Type, GetValueAtCell(RowNo, 4));
            Evaluate(GSImportBuffer."Payment Method", GetValueAtCell(RowNo, 5));
            Evaluate(GSImportBuffer.Quantity, GetValueAtCell(RowNo, 6));
            Evaluate(GSImportBuffer."Unit Price", GetValueAtCell(RowNo, 7));
            GSImportBuffer."Sheet Name" := SheetName;
            GSImportBuffer."File Name" := FileName;
            GSImportBuffer."Imported Date" := Today;
            GSImportBuffer."Time Imported" := Time;
            GSImportBuffer.Insert();


        end;
        Message(ExcelImportSuccess);


    end;

    local procedure ExportExcelEntries(var GSExel: Record "GS Excel Import Buffer")
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        GSEntriesLbl: Label 'GS Excel Entries';
        ExcelFileName: Label 'GSExcel Entries_%1_%2';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();

        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Product No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Customer-No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption(Date), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption(Type), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Payment Method"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption(Quantity), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Unit Price"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        if GSExel.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(GSExel."Product No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."Customer-No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel.Date, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(GSExel.Type, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."Payment Method", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel.Quantity, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(GSExel."Unit Price", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);

            until GSExel.Next() = 0;


        TempExcelBuffer.CreateNewBook(GSEntriesLbl);
        TempExcelBuffer.WriteSheet(GSEntriesLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();

    end;
}
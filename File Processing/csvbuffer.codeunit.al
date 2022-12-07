codeunit 50113 CSVImport
{

    trigger OnRun()
    var
        CSVItem: Record CSVBufferImport;

        TempCSVBuffer: Record "CSV Buffer" temporary;
        LineNo: Integer;
        CSVinstream: InStream;
        uploadres: Boolean;
        DialogCap: Text;
        CSVfilename: text;
        Item: Record Item;

    begin
        uploadres := UploadIntoStream(DialogCap, '', '', CSVfilename, CSVinstream);
        TempCSVBuffer.DeleteAll;
        TempCSVBuffer.LoadDataFromStream(CSVinstream, ',');

        if (TempCSVBuffer."Field No." = 1) then
            repeat
                Item.Init();
                case TempCSVBuffer."Field No." of
                    1:
                        Item.Validate("No.", TempCSVBuffer.Value);
                    2:
                        Item.Validate(Description, TempCSVBuffer.Value);
                    3:
                        Item.Validate("Item Category Code", TempCSVBuffer.Value);
                    4:
                        if not Item.insert() then
                            Item.Modify();
                end;

            until TempCSVBuffer.Next() = 0;
    end;


}
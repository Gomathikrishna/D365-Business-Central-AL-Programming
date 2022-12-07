page 50116 "XMLPorts Export"
{
    // page 50142 - XMLPorts Runner v.1.0
    PageType = Card;
    Editable = True;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Caption = 'XMLPorts - Runner';

    layout
    {
        area(content)
        {
            field(import; flagimport)
            {
                ApplicationArea = All;
                Caption = 'Flag Import';
            }
            field(numeroxmlport; xmlportno)
            {
                ApplicationArea = All;
                Caption = 'Num. XMLPort';

                 
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(runxmlport)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if flagimport = true then
                        RunXMLPortImport
                    else
                        RunXMLPortExport
                end;
            }
        }
    }

    var
        FileInstream: InStream;
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
        MyOutStream: OutStream;
        MyInStream: InStream;
        outputFileName: Text;
        Xmlport1: XMLport InventoryItems;
        flagimport: Boolean;
        xmlportno: Integer;

    procedure RunXMLPortImport()
    begin
        UploadIntoStream('', '', '', FileName, FileInstream);
        XMLPORT.Import(xmlportno, FileInstream); //Dynamic XMLPort No.
        Message('Import Done successfully.');
    end;

    procedure RunXMLPortExport()
    begin
        TempBlob.CreateOutStream(MyOutStream);
        XMLPORT.Export(xmlportno, MyOutStream); //Dynamic XMLPort No.
        TempBlob.CreateInStream(MyInStream);
        outputFileName := 'MyOutput.xml';
        DownloadFromStream(MyInStream, '', '', '', outputFileName);  //Save in Download folder
        Message('Export Done successfully.');
    end;
}

codeunit 50110 XMLImport
{
    procedure XMLTest()
    var
        xmldoc: XmlDocument;
        xmldec: XmlDeclaration;
        Rootnode: XmlElement;
        ParentNode: XmlElement;
        cust: Record Customer;
        FieldCaption: Text;
        xmltxt: XmlText;
        ChildNode: XmlElement;
        TempBlob: Codeunit "Temp Blob";
        instr: InStream;
        outstr: OutStream;
        readtxt: Text;
        writetxt: Text;

    begin
        xmldoc := XmlDocument.Create();
        xmldec := XmlDeclaration.Create('1.0', 'UTF-8', '');
        xmldoc.SetDeclaration(xmldec);
        Rootnode := XmlElement.Create('Table');
        xmldoc.Add(Rootnode);
        cust.FindSet();

        repeat
            cust.CalcFields(Balance);
            ParentNode := XmlElement.Create('Customer');
            Rootnode.Add(ParentNode);

            FieldCaption := cust.FieldCaption("No.");
            ChildNode := XmlElement.Create(FieldCaption);
            xmltxt := XmlText.Create(cust."No.");
            ChildNode.Add(xmltxt);
            ParentNode.Add(ChildNode);

            FieldCaption := cust.FieldCaption(Name);
            ChildNode := XmlElement.Create(FieldCaption);
            xmltxt := XmlText.Create(cust.Name);
            ChildNode.Add(xmltxt);
            ParentNode.Add(ChildNode);

        until cust.Next() = 0;

        TempBlob.CreateInStream(instr);
        TempBlob.CreateOutStream(outstr);

        xmldoc.WriteTo(outstr);
        outstr.WriteText(writetxt);
        instr.ReadText(writetxt);
        readtxt := 'customerimport.xml';
        DownloadFromStream(instr, '', '', '', readtxt);
    end;

    procedure ImportData()
    var
        FromFile: Text; //choose the file in the file explorer
        Instr: InStream;
        xmldoc: XmlDocument;
        tab: XmlElement;
        nodelist: XmlNodeList;
        nodee: XmlNode;
        nodee1: XmlNode;
        Customer: Record Customer;
        nodelistsec: XmlNodeList;
        element: XmlElement;

    //to get the xml file from the user
    begin
        if UploadIntoStream('Upload XML file', '', '', FromFile, Instr) then
            XmlDocument.ReadFrom(Instr, xmldoc)
        else
            Error('Not an XML File');

        //to find the root element
        if xmldoc.GetRoot(tab) then
            nodelist := tab.GetChildElements();

        foreach nodee in nodelist do begin
            Customer.Init();
            element := nodee.AsXmlElement();
            nodelistsec := element.GetChildElements();

            foreach nodee1 in nodelistsec do begin
                case nodee1.AsXmlElement().Name of
                    'No.':
                        Customer.Validate(Customer."No.", nodee1.AsXmlElement().InnerText);
                    'Name':
                        Customer.Validate(Customer.Name, nodee1.AsXmlElement().InnerText);
                    'Address':
                        Customer.Validate(Customer.Address, nodee1.AsXmlElement().InnerText);
                end;

            end;

            Customer.Insert()
        end;
        Message('Successfully Uploaded');
    end;
}
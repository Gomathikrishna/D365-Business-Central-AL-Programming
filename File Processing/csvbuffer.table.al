table 50113 CSVBufferImport
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ItemNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; ItemDescription; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(3; ItemCategoryCode; code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; ItemNo)
        {
            Clustered = true;
        }
    }

    var
        IndexDoesNotExistErr: Label 'The field in line %1 with index %2 does not exist. The data could not be retrieved.', Comment = '%1 = line no, %2 = index of the field';
        //CSVFile: DotNet File;
        //StreamReader: DotNet StreamReader;
        Separator: Text[1];
        CharactersToTrim: Text;



}
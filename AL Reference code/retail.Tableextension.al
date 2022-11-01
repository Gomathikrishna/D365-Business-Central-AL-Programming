tableextension 50115 RetailWinterSportsStore extends Customer
{
    fields
    {
        field(50116; ShoeSize; Integer)
        {
            Caption = 'ShoeSize';

            trigger OnValidate();
            begin
                if (rec.ShoeSize > 10) then begin
                    message('Shoe size not valid: %1', rec.ShoeSize);
                    message('Shoe size not valid: %1', xrec.ShoeSize);
                end;
            end;
        }
    }

    procedure HasShoeSize(): Boolean;
    begin
        exit(ShoeSize <> 0);
    end;

    trigger OnBeforeInsert();
    begin
        if not HasShoeSize then
            ShoeSize := Random(42);
    end;
}


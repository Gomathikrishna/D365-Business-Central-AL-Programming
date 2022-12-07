tableextension 50121 CustomerTableExtensions_PKT extends Customer
{
    fields
    {

        field(50121; "Customer Category Code_PKT"; Code[20])
        {
            TableRelation = "Customer Category_PKT".Code;
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                CustomerCategory: Record "Customer Category_PKT";
                ErrBlocked: Label 'This category is Blocked.';
            begin
                CustomerCategory.Get("Customer Category Code_PKT");
                if CustomerCategory.Blocked then
                    Error(ErrBlocked);
            end;
        }
    }


    keys
    {
        key(CustomerCategory; "Customer Category Code_PKT")
        {
        }


    }




}



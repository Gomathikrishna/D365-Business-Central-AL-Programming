tableextension 50122 "ItemLedgerEntryExtension_PKT" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Customer Category Code_PKT"; Code[20])
        {
            TableRelation = "Customer Category_PKT".Code;
            Caption = 'Customer Category';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(FK; "Customer Category Code_PKT")
        {
        }
    }
}

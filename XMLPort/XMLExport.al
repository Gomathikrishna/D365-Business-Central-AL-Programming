xmlport 50100 ExportItemsXmlPort
{
Format = VariableText;
Direction = Export;
TextEncoding = UTF8;
UseRequestPage = false;
TableSeparator = '';
schema
{
textelement(Root)
{
tableelement(Integer; Integer)
{
XmlName = 'ItemHeader';
SourceTableView = SORTING(Number) WHERE(Number = CONST(1));
textelement(ItemNoTitle)
{
trigger OnBeforePassVariable()
begin
ItemNoTitle := Item.FieldCaption("No.");
end;
}
textelement(ItemDescTitle)
{
trigger OnBeforePassVariable()
begin
ItemDescTitle := Item.FieldCaption(Description);
end;
}
textelement(ItemTypeTitle)
{
trigger OnBeforePassVariable()
begin
ItemTypeTitle := Item.FieldCaption(Type);
end;
}
textelement(ItemInventoryTitle)
{
trigger OnBeforePassVariable()
begin
ItemInventoryTitle := Item.FieldCaption(Inventory);
end;
}
textelement(ItemBaseUnitofMeasureTitle)
{
trigger OnBeforePassVariable()
begin
ItemBaseUnitofMeasureTitle := Item.FieldCaption("Base Unit of Measure");
end;
}
textelement(ItemBaseCostisAdjustedTitle)
{
trigger OnBeforePassVariable()
begin
ItemBaseCostisAdjustedTitle := Item.FieldCaption("Cost is Adjusted");
end;
}
textelement(ItemUnitCostTitle)
{
trigger OnBeforePassVariable()
begin
ItemUnitCostTitle := Item.FieldCaption("Unit Cost");
end;
}
textelement(ItemUnitPriceTitle)
{
trigger OnBeforePassVariable()
begin
ItemUnitPriceTitle := Item.FieldCaption("Unit Price");
end;
}
textelement(ItemVendorNoTitle)
{
trigger OnBeforePassVariable()
begin
ItemVendorNoTitle := Item.FieldCaption("Vendor No.");
end;
}
}
tableelement(Item; Item)
{
XmlName = 'Item';
RequestFilterFields = "No.";
fieldelement(No; Item."No.")
{
}
fieldelement(Description; Item.Description)
{
}
fieldelement(Type; Item.Type)
{
}
fieldelement(Inventory; Item.Inventory)
{
}
fieldelement(BaseUnitofMeasure; Item."Base Unit of Measure")
{
}
fieldelement(CostisAdjusted; Item."Cost is Adjusted")
{
}
fieldelement(UnitCost; Item."Unit Cost")
{
}
fieldelement(UnitPrice; Item."Unit Price")
{
}
fieldelement(VendorNo; Item."Vendor No.")
{
}
}
}
}
}

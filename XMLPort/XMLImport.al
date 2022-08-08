xmlport 50101 ImportItemsXmlPort
{
Format = VariableText;
Direction = Import;
TextEncoding = UTF8;
UseRequestPage = false;
TableSeparator = '';//New line
schema
{
textelement(Root)
{
tableelement(Item; Item)
{
XmlName = 'Item';
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

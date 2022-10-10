report 50105 TopNCustomers
{
    Caption = 'Top customers';
    //CaptionML = ENU = 'Name', DAN = 'Navn', ESP = 'Nombre', FRA = 'Nom', ENC = 'Name';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    AdditionalSearchTerms = 'Report TopNCustomers';
    DefaultLayout = RDLC;
    RDLCLayout = 'Top N Customers Report.rdl';


    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting();
            column(customerNo; customerNo) { }
            column(customerName; customerName) { }
            column(customerBalance; customerBalance) { }

            column(city; city) { }


            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TopN);
                TopNCustomers.TopNumberOfRows(TopN);
                TopNCustomers.open();
            end;

            trigger OnAfterGetRecord()
            begin
                if TopNCustomers.Read() then begin
                    customerNo := TopNCustomers.No;
                    customerName := TopNCustomers.Name;
                    customerBalance := TopNCustomers.BalanceLCY;
                    city := TopNCustomers.City;
                end
                else begin
                    CurrReport.Skip();
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(TopN; TopN)
                    {
                        Caption = 'Top Records which you like to generate a report:';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        TopN := 5;
    end;

    var
        TopNCustomers: Query TopNCustomers;
        TopN: Integer;
        customerNo: Code[20];
        customerName: Text;
        customerBalance: Decimal;
        city: Text;
}
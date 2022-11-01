report 50102 MyProcessingOnlyReport
{
    Caption = 'My ProcessingOnly Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    AdditionalSearchTerms = 'My ProcessingOnly Report';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin
                counter += 1;
            end;

            trigger OnPostDataItem()
            begin

            end;
        }
    }
    trigger OnInitReport()
    begin
        clear(counter);
    end;

    trigger OnPreReport()
    begin

    end;

    trigger OnPostReport()
    begin
        Message('Records Processed: %1 for: %2', counter, Customer.GetFilters());
    end;

    var
        counter: Integer;
}
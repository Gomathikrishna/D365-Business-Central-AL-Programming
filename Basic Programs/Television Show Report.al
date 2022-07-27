report 50100 "Television Shows"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;
    WordLayout = 'Television.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem(DataItemName; "Television Show")
        {
                column("No"; "No.") {  }
                column("TelevisionShowType"; "Television Show Type") {  }
                column("Name"; "Name") {  }
                column("RunTime"; "Run Time") {  }
                column("HostCode"; "Host Code") {  }
                column("HostName"; "Host Name") {  }
                column("AverageListeners"; "Average Listeners") {  }
                column("AudienceShare"; "Audience Share") {  }
                column("AdvertisingRevenue"; "Advertising Revenue") {  }
                column("RoyaltyCost"; "Royalty Cost") {  }

        }
    }
}

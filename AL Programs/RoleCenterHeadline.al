page 50107 RoleCenterHeadline
{
    PageType = HeadlinePart;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Welcome; Welcome)
                {
                    ApplicationArea = All;
                }
                field(Awesome; BusinessCentralIsAwesomeLbl)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Hyperlink('https://go.microsoft.com/fwlink/?linkid=867580');
                    end;
                }
            }

        }
    }

    trigger OnOpenPage()
    var
        Welcome: Text;
    begin
        Welcome := StrSubstNo(WelcomeLbl, UserId());
    end;

    protected var
        myString: Text;

    var
        WelcomeLbl: Label 'Welcome %1';
        BusinessCentralIsAwesomeLbl: Label '<qualifier>Microsoft Learn</qualifier><payload>Headlines in <emphasize>Business Central</emphasize> are awesome!</payload>';
        Welcome: Text;
        SalesAmount: array[5] of Integer;
        SalesAmount2: List of [Integer];


}

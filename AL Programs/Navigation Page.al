page 50105 "Demo"
{
    Caption = 'Navigation Demo';
    PageType = NavigatePage;

    layout
    {
        area(content)
        {
            group(Step1)
            {
                Visible = Step1Visible;
                Caption = 'Welcome to Learn Navigation Page';
                InstructionalText = 'You are in step 1';

            }
            group(Step2)
            {
                Visible = Step2Visible;
                group("yOU ARE IN STEP 2")
                {
                    Caption = 'Welcome to Learn Navigation Page';

                    InstructionalText = 'You are in step 2';
                }
            }

            group(Step4)
            {
                Visible = Step4Visible;

                group(Group23)
                {
                    Caption = 'OK';
                    InstructionalText = 'You have finished the setup';
                }
                group("That's it!")
                {
                    Caption = 'That''s it!';
                    group(Group25)
                    {
                        ShowCaption = false;
                        InstructionalText = 'Success. Yay!';
                    }
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction();
                begin
                    FinishAction();
                end;
            }
        }
    }


    trigger OnOpenPage();

    begin
        Step := Step::Start;
        EnableControls();
    end;


    var
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step4Visible: Boolean;
        Step: Option Start,Step2,Finish;
        BackActionEnabled: Boolean;
        FinishActionEnabled: Boolean;
        NextActionEnabled: Boolean;


    local procedure EnableControls();
    begin
        ResetControls();

        case Step of
            Step::Start:
                ShowStep1();
            Step::Step2:
                ShowStep2();
            Step::Finish:
                ShowStep4();
        end;
    end;



    local procedure FinishAction();
    begin

        CurrPage.Close();
    end;

    local procedure NextStep(Backwards: Boolean);
    begin
        if Backwards then
            Step := Step - 1
        ELSE
            Step := Step + 1;

        EnableControls();
    end;

    local procedure ShowStep1();
    begin
        Step1Visible := true;

        FinishActionEnabled := false;
        BackActionEnabled := false;
    end;

    local procedure ShowStep2();
    begin
        Step2Visible := true;

        FinishActionEnabled := true;
        BackActionEnabled := false;
    end;

    local procedure ShowStep4();
    begin
        Step4Visible := true;

        NextActionEnabled := false;
        FinishActionEnabled := true;
    end;

    local procedure ResetControls();
    begin
        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;

        Step1Visible := false;

        Step4Visible := false;
    end;

}
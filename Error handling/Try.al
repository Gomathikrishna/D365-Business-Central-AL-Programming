codeunit 50102 Tryblock
{
    trigger OnRun()
    begin
        MyTrymethod;
        message('Everything went well');
    end;

    [TryFunction]
    local procedure MyTryMethod()
    begin
        error('An error occurred during the operation');
    end;
}
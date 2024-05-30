codeunit 50100 "NavigationPage"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', false, false)]
    local procedure AddNavigationDemoWizard()
    var
        AssistedSetup: Codeunit "Guided Experience";
    begin
        AssistedSetup.InsertAssistedSetup(SetupTxt, SetupTxt, SetupTxt, 1000, ObjectType::Page, Page::"Demo", "Assisted Setup Group"::Extensions, '', "Video Category"::Uncategorized, '');
    end;

    var
        SetupTxt: Label 'Navigation Page Demo';
}
// codeunit 50104 "Installation Code"
// {
//     Subtype = Install;

//     trigger OnInstallAppPerCompany()
//     var
//         Cust: Record Customer;
//         UserPersonalization: Record "User Personalization";
//     begin
//         UserPersonalization.Reset();
//         UserPersonalization.SetRange("User ID", 'ADMIN');
//         if UserPersonalization.FindFirst() then begin
//             if CompanyName() = UserPersonalization.Company then
//                 if Cust.Get(10000) then begin
//                     Cust.Name := 'Modified By Install Codeunit';
//                     Cust.Modify();
//                 end;
//         end;
//     end;
// }
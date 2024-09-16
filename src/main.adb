with Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Strings.Unbounded;
with person_package, company_package;
use company_package;

procedure Main is
   com1 : Company;

   type MyJobType is (Doctor, Engineer, Businessman);
   for MyJobType use (300, 400, 500);
   type MyExpType is (Junior, Medior, Senior);
   for MyExpType use (1, 2, 3);
   procedure JobOutput (J : in MyJobType) is
   begin
      case J is
         when Doctor => Put ("Doctor");
         when Engineer => Put ("Engineer");
         when Businessman => Put ("Businessman");
      end case;
   end JobOutput;
   procedure ExpOutput (E : in MyExpType) is
   begin
      case E is
         when Junior => Put ("Junior");
         when Medior => Put ("Medior");
         when Senior => Put ("Senior");
      end case;
   end ExpOutput;

   package MyPerson is new person_package (JobG => MyJobType, ExperienceG => MyExpType, CompanyG => Company, StringJob => JobOutput, StringExp => ExpOutput);
   use MyPerson;
   procedure SuccessOrNot is new BuyStock(company_package.GetStockPrice, company_package.ProcessPurchase, company_package.PossibleToBuy);
   Alice : Person;
   Anna : Person;
   Bob : Person;
   Kei : Person;
   Satoru : Person;
begin
   New_Line;
   Put_Line("----Charactors after the initialization and 5 months salary.");
   Init (Alice, To_Unbounded_String ("Alice"), Doctor, Junior);
   Init (Anna, To_Unbounded_String ("Anna"), Doctor, Senior);
   Init (Bob, To_Unbounded_String ("Bob"), Engineer, Medior);
   Init (Kei, To_Unbounded_String ("Kei"), Businessman, Junior);
   Init (Satoru, To_Unbounded_String ("Satoru"), Doctor, Junior);
   Save (Alice, 5, MyJobType'Enum_Rep (ReturnJob (Alice)), MyExpType'Enum_Rep (ReturnExp (Alice)));
   Save (Anna, 5, MyJobType'Enum_Rep (ReturnJob (Anna)), MyExpType'Enum_Rep (ReturnExp (Anna)));
   Save (Bob, 5, MyJobType'Enum_Rep (ReturnJob (Bob)), MyExpType'Enum_Rep (ReturnExp (Bob)));
   Save (Kei, 5, MyJobType'Enum_Rep (ReturnJob (Kei)), MyExpType'Enum_Rep (ReturnExp (Kei)));
   Save (Satoru, 5, MyJobType'Enum_Rep (ReturnJob (Satoru)), MyExpType'Enum_Rep (ReturnExp (Satoru)));
   PrintPerson (Alice);
   PrintPerson (Anna);
   PrintPerson (Bob);
   PrintPerson (Kei);
   PrintPerson (Satoru);

   New_Line;
   Put_Line("----Initial Information of a Company");
   PrintCompany (com1);
   Put_Line("");

   New_Line;
   Put_Line("----After Alice bought 10 stock.(Success)");
   SuccessOrNot (com1, Alice, 10);
   PrintPerson (Alice);
   PrintCompany (com1);
   Put_Line("");

   New_Line;
   Put_Line("----After Anna bought 30 stock.(Success)");
   SuccessOrNot (com1, Anna, 30);
   PrintPerson (Anna);
   PrintCompany (com1);
   Put_Line("");

   New_Line;
   Put("----After Bob bought 20 stock.(Success)");
   SuccessOrNot (com1, Bob, 10);
   PrintPerson (Bob);
   PrintCompany (com1);
   Put_Line("");

   New_Line;
   Put_Line("----After Kei bought 10 stock.(Success)");
   SuccessOrNot (com1, Kei, 10);
   PrintPerson (Kei);
   PrintCompany (com1);
   Put_Line ("");

   New_Line;
   Put_Line("----After Satoru try to buy 10 stock.(Fail: Reach max number of owner.)");
   SuccessOrNot (com1, Satoru, 10);
   PrintPerson (Satoru);
   PrintCompany (com1);
   Put_Line ("");

   New_Line;
   Put_Line("----After Anna try to buy 50 stock.(Fail: Reach max number of stock.)");
   SuccessOrNot (com1, Anna, 50);
   PrintPerson (Anna);
   PrintCompany (com1);
   Put_Line("");

   New_Line;
   Put_Line("----After Satoru try to buy 40 stock.(Fail: Not enough savings.)");
   SuccessOrNot (com1, Satoru, 40);
   PrintPerson (Satoru);
   PrintCompany (com1);
   Put_Line("");

end Main;

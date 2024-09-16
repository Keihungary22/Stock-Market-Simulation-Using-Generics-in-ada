with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

generic
   type JobG is private;
   type ExperienceG is private;
   type CompanyG is private;
   with procedure StringJob (J : in JobG);
   with procedure StringExp (E : in ExperienceG);
package person_package is
   type Person is private;
   
   procedure Init(P : in out Person; N: Unbounded_String; J : in JobG; E : in ExperienceG);
   procedure Save (P : in out Person; M : in Integer; J : in Integer; E : in Integer);
   procedure PrintPerson (P : in Person);
   function ReturnJob (P : Person) return JobG;
   function ReturnExp ( P : Person) return ExperienceG;
   function ReturnName (P : Person) return Unbounded_String;
   
   generic
      with function GetStockPrice (C : CompanyG)return Integer;
      with procedure ProcessPurchase (C : in out CompanyG; N : in Unbounded_String; S : in Integer);
      with function CompanyAvailable(C : CompanyG; N : Unbounded_String; S :Integer) return Boolean;
   procedure BuyStock (C : in out CompanyG; P : in out Person; S : in Integer);
   
private
   type Person is record
      Name : Unbounded_String;
      Job : JobG;
      Experience : ExperienceG;
      Savings : Integer;
   end record;
   
end person_package;

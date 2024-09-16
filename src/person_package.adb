with Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Strings.Unbounded;

package body person_package is
   procedure Init (P : in out Person; N : Unbounded_String; J : in JobG; E : in ExperienceG) is
   begin
      P.Name := N;
      P.Job := J;
      P.Experience := E;
      P.Savings := 0;
   end Init;
   
   procedure Save (P : in out Person; M : in Integer; J : in Integer; E : in Integer) is
   begin
      P.Savings := P.Savings + (M * J * E);
   end Save;
   
   procedure PrintPerson (P : in Person) is
   begin
      --Put_Line(To_String(P.Name) & StringJob(P.Job) & StringExp(P.Experience) & P.Savings'Image);
      Put (To_String (P.Name) & " ");
      StringJob (P.Job);
      Put(" ");
      StringExp (P.Experience);
      Put(" ");
      Put (P.Savings'Image);
      New_Line;
   end PrintPerson;
   
   function ReturnJob (P : Person) return JobG is
   begin 
      return P.Job;
   end ReturnJob;
   
   function ReturnExp (P : Person) return ExperienceG is
   begin 
      return P.Experience;
   end ReturnExp;
   
   function ReturnName (P : Person) return Unbounded_String is
   begin 
      return P.Name;
   end ReturnName;
   
   procedure BuyStock (C : in out CompanyG; P : in out Person; S : in Integer) is
      stockPrice : Integer := GetStockPrice(C);
   begin
      if P.Savings < S * stockPrice then
         Put_Line ("There is not enough savings.");
      elsif not (CompanyAvailable (C, P.Name, S)) then
         ProcessPurchase (C, P.Name, S);
      else
         ProcessPurchase (C, P.Name, S);
         P.Savings := P.Savings - (S * stockPrice);
      end if;
      
   end BuyStock;
   
   
end person_package;

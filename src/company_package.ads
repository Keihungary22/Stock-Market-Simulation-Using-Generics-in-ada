with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package company_package is
   type Company is private;
   
   procedure AddOwnership (Comp : in out Company; N : in Unbounded_String; S : in Integer);
   procedure ProcessPurchase (Comp : in out Company; N : in Unbounded_String; S : in Integer);
   function GetStockPrice (Comp : Company) return Integer;
   procedure PrintCompany (Comp : in Company);
   function PossibleToBuy (Comp : Company; N : Unbounded_String; S : Integer) return Boolean;

private
   type owner_list is array (1..10) of Unbounded_String;
   type Company is record
      ID : Integer := 1;
      max_owner : Integer := 4;
      max_stock : Integer := 100;
      stock_price : Integer := 50;
      fundings : Integer := 0;
      owner_count : Integer := 0;
      stock_count : Integer := 0;
      owners : owner_list;
   end record;
   
end company_package;

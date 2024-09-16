with Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Strings.Unbounded;

package body company_package is
   
   procedure AddOwnership (Comp : in out Company; N : in Unbounded_String; S : in Integer) is
      check_dup : Boolean := False;
      check_dup_ind : Integer := 0;
   begin
      for i in 1 .. Comp.owner_count loop
            if Comp.owners (i) = N then
               check_dup := True;
               check_dup_ind := i;
            end if;
      end loop;
      
      if check_dup then
         Comp.stock_count := Comp.stock_count + S;
         Comp.fundings := Comp.fundings + Comp.stock_price * S;
      else
         Comp.owner_count := Comp.owner_count + 1;
         Comp.owners (Comp.owner_count) := N;
         Comp.stock_count := Comp.stock_count + S;
         Comp.fundings := Comp.fundings + Comp.stock_price * S;
      end if;  
      
   end AddOwnership;
   
   procedure PrintCompany (Comp : in Company) is
   begin
      Put ("Company ID: " & Comp.ID'Image);
      Put ("  Max Owner: " & Comp.max_owner'Image);
      Put ("  Max Stock: " & Comp.max_stock'Image);
      New_Line;
      Put ("Stock Price: " & Comp.stock_price'Image);
      Put ("  Fundings: " & Comp.fundings'Image);
      Put ("  Owner Count: " & Comp.owner_count'Image);
      Put ("  Stock Count: " & Comp.stock_count'Image);
      New_Line;
      Put ("Stock Holders: ");
      for i in 1 .. Comp.owner_count loop
         Put (To_String (Comp.owners (i)) & " ");
      end loop;
   end PrintCompany;
   
   procedure ProcessPurchase (Comp : in out Company; N : in Unbounded_String; S : in Integer) is
   begin
      if Comp.max_stock < (Comp.stock_count + S) then
         Put_Line ("Max number of stock is already reached.");
      elsif Comp.owner_count >= Comp.max_owner then
         for i in Comp.owners'Range loop
            if Comp.owners (i) = N then
               AddOwnership (Comp, N, S);
            end if;
         end loop;
         Put_Line ("Max number of owner is already reached.");
      else
         AddOwnership(Comp, N, S);
      end if;
   end ProcessPurchase;
   
   function GetStockPrice (Comp : Company) return Integer is
   begin
      return Comp.stock_price;
   end GetStockPrice;
   
   function PossibleToBuy (Comp : Company; N : Unbounded_String; S : Integer) return Boolean is
   begin 
      if Comp.max_stock < (Comp.stock_count + S) then
         return False;
      elsif Comp.owner_count >= Comp.max_owner then
         for i in Comp.owners'Range loop
            if Comp.owners (i) = N then
               return True;
            end if;
         end loop;
         return False;
      else
         return True;
      end if;
   end;

end company_package;

--  with Ada.Text_IO, Ada.Strings.Unbounded;
--  use Ada.Text_IO, Ada.Strings.Unbounded;
--  
--  package body company_package is
--  
--     procedure AddOwnership (Comp : in out Company; N : in Unbounded_String; S : in Integer) is
--        check_dup : Boolean := False;
--        check_dup_ind : Integer := 0;
--     begin
--        for i in 1 .. Comp.owner_count loop
--              if Comp.owners (i) = N then
--                 check_dup := True;
--                 check_dup_ind := i;
--              end if;
--        end loop;
--  
--        if check_dup then
--           Comp.stock_count := Comp.stock_count + S;
--           Comp.fundings := Comp.fundings + Comp.stock_price * S;
--        else
--           Comp.owner_count := Comp.owner_count + 1;
--           Comp.owners (Comp.owner_count) := N;
--           Comp.stock_count := Comp.stock_count + S;
--           Comp.fundings := Comp.fundings + Comp.stock_price * S;
--        end if;
--  
--     end AddOwnership;
--  
--     procedure PrintCompany (Comp : in Company) is
--     begin
--        Put ("Company ID: " & Comp.ID'Image);
--        Put ("  Max Owner: " & Comp.max_owner'Image);
--        Put ("  Max Stock: " & Comp.max_stock'Image);
--        New_Line;
--        Put ("Stock Price: " & Comp.stock_price'Image);
--        Put ("  Fundings: " & Comp.fundings'Image);
--        Put ("  Owner Count: " & Comp.owner_count'Image);
--        Put ("  Stock Count: " & Comp.stock_count'Image);
--        New_Line;
--        Put ("Stock Holders: ");
--        for i in 1 .. Comp.owner_count loop
--           Put (To_String (Comp.owners (i)) & " ");
--        end loop;
--     end PrintCompany;
--  
--     procedure ProcessPurchase (Comp : in out Company; N : in Unbounded_String; S : in Integer) is
--     begin
--        New_Line;
--        if Comp.owner_count >= Comp.max_owner then
--           Put_Line ("Max number of owner is already reached.");
--        elsif Comp.max_stock < (Comp.stock_count + S) then
--           Put_Line ("Max number of stock is already reached.");
--        else
--           AddOwnership(Comp, N, S);
--        end if;
--     end ProcessPurchase;
--  
--     function GetStockPrice (Comp : Company) return Integer is
--     begin
--        return Comp.stock_price;
--     end GetStockPrice;
--  
--     function PossibleToBuy (Comp : Company; S : Integer) return Boolean is
--     begin
--        if Comp.owner_count >= Comp.max_owner then
--           return False;
--        elsif Comp.max_stock < (Comp.stock_count + S) then
--           return False;
--        else
--           return True;
--        end if;
--     end;
--  
--  end company_package;

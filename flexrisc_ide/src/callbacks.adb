with Gtk.Main;              use Gtk.Main;
with Gtk.Label;             use Gtk.Label;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Ada.Text_IO;           use Ada.Text_IO;
with GNAT.OS_Lib; use GNAT.OS_Lib;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Gtk.List_Box_Row; use Gtk.List_Box_Row;  
with Gtk.Label; use Gtk.Label;                


package body Callbacks is

   procedure Stop_Program (Emetteur : access Gtk_widget_Record'class) is
      pragma Unreferenced (Emetteur);
   begin
      Main_Quit;
   end Stop_Program;

   procedure Reseting (Emetteur : access GTK_Widget_Record'Class; F : Fenetre_T) is
      file_empty : constant String := "";
      pragma Unreferenced (Emetteur);
   begin
      F.Lbl.set_text ("No files selected");
      P_Fenetre.Set_File_Name(file_empty);
   end Reseting;

   procedure Run (Emetteur : access GTK_Widget_Record'Class;  F : Fenetre_T) is
      File_Name : String := Gtkada.File_Selection.File_Selection_Dialog;
      New_Row   : Gtk_List_Box_Row;
      File_Label : Gtk_Label;
      pragma Unreferenced (Emetteur);
   begin
      if File_Name /= "" then
         F.Lbl.set_text ("You selected : " & File_Name);
         P_Fenetre.Set_File_Name (File_Name);

          -- Add the selected file to the File_History list box
      Gtk_New(New_Row);               
      Gtk_New(File_Label, File_Name); 

       -- Adjust label alignment to left
      File_Label.Set_Xalign(0.0);      
      File_Label.Set_Yalign(0.5);  

      New_Row.Add(File_Label);         
      File_Label.Show;                 
      F.File_History.Insert(New_Row, 0);    
      New_Row.Show;  

      end if;
      Ada.Text_IO.Put_Line ("Le texte du label est : " & File_Name);
   end;

   PROCEDURE Prog_FPGA(Emetteur : ACCESS GTK_Widget_Record'Class ; F : Fenetre_T) IS 
      File_Name :constant String := P_Fenetre.Get_File_Name; 
      Program_Name : constant String := "quartus_pgm";
      -- Construction des arguments explicites
      Arguments : Argument_List := (
         new String'("-c"),
         new String'("USB-Blaster"),
         new String'("-m"),
         new String'("JTAG"),
         new String'("-o"),
         new String'("""" & "p;" & File_Name & """")
      );

      Result : Integer;

   BEGIN 
      -- Exécuter la commande système
      Result := GNAT.OS_Lib.Spawn (Program_Name => Program_Name,
                                Args => Arguments
                                );

      if Result = 0 then
         Put_Line ("Command successful");
      else
         Put_Line ("Unable to execute the command");
      end if;

   END;

end Callbacks;

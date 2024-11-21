with Gtk.Main;              use Gtk.Main;
with Gtk.Label;             use Gtk.Label;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Ada.Text_IO;           use Ada.Text_IO;

package body Callbacks is

   procedure Stop_Program (Emetteur : access Gtk_widget_Record'class) is
      pragma Unreferenced (Emetteur);
   begin
      Main_Quit;
   end Stop_Program;

   procedure Reseting (Emetteur : access GTK_Widget_Record'Class; F : Fenetre_T)
   is
      pragma Unreferenced (Emetteur);
   begin
      F.Lbl.set_text ("No files selected");
   end Reseting;

   procedure Run (Emetteur : access GTK_Widget_Record'Class) is
      File_Name : String := Gtkada.File_Selection.File_Selection_Dialog;
      pragma Unreferenced (Emetteur);
   begin
      if File_Name /= "" then
         P_Fenetre.Set_File_Name (File_Name);
      end if;
      Ada.Text_IO.Put_Line ("Le texte du label est : " & File_Name);
   end;

end Callbacks;

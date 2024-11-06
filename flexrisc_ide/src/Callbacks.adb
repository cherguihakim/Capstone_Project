WITH Gtk.Main ;                USE Gtk.Main ;
WITH Gtk.Label ;                 USE Gtk.Label ;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Ada.Text_IO; use Ada.Text_IO;


PACKAGE BODY Callbacks IS


   PROCEDURE Stop_Program(Emetteur : access Gtk_widget_Record'class) IS
      PRAGMA Unreferenced (Emetteur );
   BEGIN
      Main_Quit;
   END Stop_Program ;


   PROCEDURE Reseting(Emetteur : ACCESS GTK_Widget_Record'Class ;
                         F : T_Fenetre) IS
      PRAGMA Unreferenced(Emetteur ) ;
   BEGIN
      F.Lbl.set_text("No files selected");
   END Reseting;

   PROCEDURE Run(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) IS 

   File_Name : String := Gtkada.File_Selection.File_Selection_Dialog;
   pragma Unreferenced (Emetteur);

   begin
    if File_Name /= "" then
        F.Lbl.set_text("You selected : " & File_Name);
    end if;

    Ada.Text_IO.Put_Line("Le texte du label est : " & File_Name);
   end Run;

END Callbacks ;
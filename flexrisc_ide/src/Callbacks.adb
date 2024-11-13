WITH Gtk.Main ;                USE Gtk.Main ;
WITH Gtk.Label ;                 USE Gtk.Label ;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Ada.Text_IO; use Ada.Text_IO;
with Gtk.List_Box_Row; use Gtk.List_Box_Row;  -- For adding rows to the File_History list box
with Gtk.Label; use Gtk.Label;                -- For displaying file names in the list


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
   New_Row   : Gtk_List_Box_Row;
   File_Label : Gtk_Label;
   pragma Unreferenced (Emetteur);

   begin
    if File_Name /= "" then
        F.Lbl.set_text("You selected : " & File_Name);
        Ada.Text_IO.Put_Line("Le texte du label est : " & File_Name);
       
       -- Add the selected file to the File_History list box
      Gtk_New(New_Row);                -- Create a new row for the file history
      Gtk_New(File_Label, File_Name);  -- Create a label with the file name
      New_Row.Add(File_Label);         -- Add the label to the row
      File_Label.Show;                 -- Show the label in the row
      F.File_History.Add(New_Row);     -- Add the row to the File_History list box
      New_Row.Show;  
    end if;

    end Run;

END Callbacks ;
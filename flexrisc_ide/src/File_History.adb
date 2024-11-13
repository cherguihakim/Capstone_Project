with Gtk.List_Box_Row;
with Ada.Text_IO; use Ada.Text_IO;

package body File_History is

   procedure Initialize_History (History : in out File_History_Type) is
   begin
      Ada.Text_IO.Put_Line("History Initialized");
   end Initialize_History;

   procedure Add_File (History : in out File_History_Type; File_Path : String) is
      New_File_Row : Gtk.List_Box_Row.Gtk_List_Box_Row;
   begin
      Gtk.List_Box_Row.Gtk_New(New_File_Row);
      History.Add(New_File_Row);
      Ada.Text_IO.Put_Line("Added to history: " & File_Path);
   end Add_File;

end File_History;

with Gtk.List_Box;

package File_History is

   type File_History_Type is new Gtk.List_Box.Gtk_List_Box; -- Based on Gtk.List_Box

   -- Initializes the history list, if needed
   procedure Initialize_History (History : in out File_History_Type);

   -- Adds a file path to the history list
   procedure Add_File (History : in out File_History_Type; File_Path : String);

end File_History;

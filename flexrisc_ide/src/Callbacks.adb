with Ada.Text_IO; use Ada.Text_IO;
with Gtk.Main; 
with Gtk.Widget;
with Gtk.Enums;          use Gtk.Enums;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Gtk;                use Gtk;

package body Callbacks is
   procedure On_Button_Clicked (Button : access Gtk_Button_Record'Class) is
   begin
      Put_Line ("Button Clicked!");
   end;

   procedure Window_Destroy
     (Object : access Gtk.Widget.Gtk_Widget_Record'Class) is
      pragma Unreferenced (Object);
   begin
      Gtk.Main.Main_Quit;
   end Window_Destroy;

   function Help return String is
   begin
      return "the @Gtkada.File_Selection_Dialog@B is a dialog to ask the user"
        & " for a file name. It can also give access to basic file and"
        & " directory manipulation, such as create, rename, delete.";
   end Help;

   procedure Run (Button : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Button);
   begin
      Ada.Text_IO.Put_Line
        ("Selected: "
         & Gtkada.File_Selection.File_Selection_Dialog
           (Title       => "Select an existing file",
            Must_Exist  => True));
   end Run;



end Callbacks;
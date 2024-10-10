with Ada.Text_IO; use Ada.Text_IO;
with Gtk.Main; 
with Gtk.Widget;

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


end Callbacks;
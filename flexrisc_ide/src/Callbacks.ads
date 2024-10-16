with Gtk.Button; use Gtk.Button;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Frame; use Gtk.Frame;

package Callbacks is
   procedure On_Button_Clicked (Button : access Gtk_Button_Record'Class);
   procedure Window_Destroy (Object : access Gtk.Widget.Gtk_Widget_Record'Class);
   procedure Run (Button : access Gtk_Button_Record'Class);
   function Help return String;




end Callbacks;
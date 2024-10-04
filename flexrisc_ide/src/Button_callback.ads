with Gtk.Button; use Gtk.Button;

package Button_callback is
   procedure On_Button_Clicked (Button : access Gtk_Button_Record'Class);
end Button_callback;
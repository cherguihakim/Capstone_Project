with Gtk.Style_Context;
with Gtk.Css_Provider;
with Ada.Text_IO; use Ada.Text_IO;

package body Window_Settings is

   procedure Set_Background_Color (Win : Gtk.Window.Gtk_Window; Color : String) is
      Css : Gtk.Css_Provider.Gtk_Css_Provider;
      Style : Gtk.Style_Context.Gtk_Style_Context;
   begin
      Gtk.Css_Provider.Gtk_New(Css);
      Gtk.Css_Provider.Load_From_Data(Css, "window { background-color: " & Color & "; }");
      Style := Gtk.Widget.Get_Style_Context(Win);
      Gtk.Style_Context.Add_Provider(Style, Css, Gtk.Style_Context.Provider_Priority_User);
      Ada.Text_IO.Put_Line("Background color set to " & Color);
   end Set_Background_Color;

end Window_Settings;
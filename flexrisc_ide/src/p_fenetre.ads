with Gtk.Window;       use Gtk.Window;
with Gtk.Enums;        use Gtk.Enums;
with Gtk.Button;       use Gtk.Button;
with Gtk.Label;        use Gtk.Label;
with Gtk.Box;          use Gtk.Box;
with Gtk.Widget;       use Gtk.Widget;
with Gtk.Grid;         use Gtk.Grid;
with Ada.Finalization; use Ada.Finalization;
with Gtk.Handlers;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package P_Fenetre is

   type Fenetre_T is new Controlled with record
      Win                                    : Gtk_Window;
      bouton_file, bouton_burn, bouton_reset : Gtk_Button;
      grid                                   : Gtk_Grid;
      Lbl                                    : Gtk_Label;
      File_Name                              : Unbounded_String;
   end record;

   procedure Initialize;

   package P_Handlers is new Gtk.Handlers.Callback (Gtk_Widget_Record);
   use P_Handlers;

   package P_UHandlers is new
     Gtk.Handlers.User_Callback (Gtk_Widget_Record, Fenetre_T);
   use P_UHandlers;

   procedure Set_File_Name (File_Name : String);

end P_Fenetre;

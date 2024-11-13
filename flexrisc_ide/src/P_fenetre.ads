WITH Ada.Finalization; USE Ada.Finalization;  -- Ensure Controlled is visible
WITH Gtk.Window;        USE Gtk.Window;
WITH Gtk.Enums;         USE Gtk.Enums;
WITH Gtk.Button;        USE Gtk.Button;
WITH Gtk.Label;         USE Gtk.Label;
WITH Gtk.Box;           USE Gtk.Box;
WITH Gtk.Widget;        USE Gtk.Widget;
WITH Gtk.Grid;          USE Gtk.Grid;
WITH Gtk.Handlers;
WITH Gtk.List_Box;      USE Gtk.List_Box;
WITH Gtk.Progress_Bar;  USE Gtk.Progress_Bar;
WITH Gtk.Scrolled_Window; USE Gtk.Scrolled_Window;
WITH File_History;
WITH Gdk;               USE Gdk;  

PACKAGE P_Fenetre IS

   TYPE T_Fenetre IS NEW Controlled WITH RECORD
      Win           : Gtk_Window;
      Bouton_File   : Gtk_Button;
      Bouton_Burn   : Gtk_Button;
      Bouton_Reset  : Gtk_Button;
      Grid          : Gtk_Grid;
      Lbl           : Gtk_Label;
      File_History  : Gtk_List_Box;
      Progress      : Gtk_Progress_Bar;
   END RECORD;

   PROCEDURE Initialize(F : IN OUT T_Fenetre);

   PACKAGE P_Handlers IS NEW Gtk.Handlers.Callback(Gtk_Widget_Record);
   USE P_Handlers;
   PACKAGE P_UHandlers IS NEW Gtk.Handlers.User_Callback(Gtk_Widget_Record, T_Fenetre);
   USE P_UHandlers;

END P_Fenetre;

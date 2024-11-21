WITH Gtk.Window ;        USE Gtk.Window ;
WITH Gtk.Enums ;         USE Gtk.Enums ;
WITH Gtk.Button ;        USE Gtk.Button ;
WITH Gtk.Label ;         USE Gtk.Label ;
WITH Gtk.Box ;           USE Gtk.Box ;
WITH Gtk.Widget ;        USE Gtk.Widget ;
WITH Gtk.Grid ;          USE Gtk.Grid ;
WITH Ada.Finalization ;  USE Ada.Finalization ;
WITH Gtk.Handlers ;
WITH Ada.Strings.Unbounded; USE Ada.Strings.Unbounded;

PACKAGE P_Fenetre IS

   TYPE T_Fenetre IS NEW Controlled WITH RECORD
      Win     : Gtk_Window ;
      bouton_file, bouton_burn, bouton_reset    : Gtk_Button ;
      grid : Gtk_Grid;
      Lbl     : Gtk_Label ;
      File_Name  : Unbounded_String;
   END RECORD ;

   TYPE T_Fenetre_Access IS Access All T_Fenetre;

   PROCEDURE Initialize(F : IN OUT T_Fenetre) ;

   PACKAGE P_Handlers IS NEW Gtk.Handlers.Callback(Gtk_Widget_Record) ;
   USE P_Handlers ;
   PACKAGE P_UHandlers IS NEW Gtk.Handlers.User_Callback(Gtk_Widget_Record,T_Fenetre_Access) ;
   use P_UHandlers ;

END P_Fenetre ;
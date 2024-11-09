WITH Gtk.Widget ;                USE Gtk.Widget ;
with P_Fenetre ;                 use P_Fenetre ;


PACKAGE Callbacks IS

   PROCEDURE Stop_Program(Emetteur : access Gtk_widget_Record'class) ;
   PROCEDURE Reseting(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) ;
   PROCEDURE Run(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) ;
   PROCEDURE Prog_FPGA(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) ;
END Callbacks ;
with Gtk.Widget; use Gtk.Widget;
with P_Fenetre;  use P_Fenetre;
with System;     use System;

package Callbacks is

   procedure Stop_Program (Emetteur : access Gtk_widget_Record'class);
   procedure Reseting (Emetteur : access GTK_Widget_Record'Class; F : Fenetre_T);
   procedure Run (Emetteur : access GTK_Widget_Record'Class);
   PROCEDURE Prog_FPGA(Emetteur : ACCESS GTK_Widget_Record'Class ; F : Fenetre_T) ;

end Callbacks;

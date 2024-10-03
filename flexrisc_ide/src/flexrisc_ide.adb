WITH Ada.Text_IO ;    USE Ada.Text_IO;
WITH Gtk.Main ;       USE Gtk.Main ; 
WITH Gtk.Window ;     USE Gtk.Window ; 
WITH Gtk.Enums ;      USE Gtk.Enums;
WITH Gtk.Button ;     USE Gtk.Button ; 


procedure Flexrisc_Ide is

win : Gtk_window ;
bouton : Gtk_Button ; 
loading_error : exception;

BEGIN
   Init ; 


   Gtk_New(Win) ;
   win.set_title("Interface Ada");
   win.set_default_size(600,400);
   win.set_position(win_pos_center);

   IF NOT win.Set_Icon_From_File("logo_interface_ada.jpg")
         THEN RAISE LOADING_ERROR ;
   END IF ; 

   Gtk_New(bouton) ; 
   bouton.set_label("Fichier");
   win.add(bouton) ; 

   win.show_all ; 
   bouton.show ;
   Main ; 

exception 
  when loading_error => Put_Line("Erreur du chargement de l'icone");

end Flexrisc_Ide;

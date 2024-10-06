with Ada.Text_IO; use Ada.Text_IO;
with Gtk.Main; use Gtk.Main;
with Gtk.Window; use Gtk.Window;
with Gtk.Enums; use Gtk.Enums;
with Gtk.Button; use Gtk.Button;
with Gtk.Grid; use Gtk.Grid;
with Gtk.Text_View; use Gtk.Text_View;
with Gtk.Scrolled_Window; use Gtk.Scrolled_Window;
with Button_callback; use Button_callback;

procedure flexrisc_ide is

   win : Gtk_Window;
   grid : Gtk_Grid;
   bouton1, bouton2, bouton3 : Gtk_Button;
   text_view : Gtk_Text_View;
   scrolled_win : Gtk_Scrolled_Window;


   -- Exception pour la gestion d'erreurs de chargement
   loading_error : exception;

begin
   Init;

   -- Création de la fenêtre principale
   Gtk_New(win);
   win.set_title("FlexRisc IDE");
   win.set_default_size(600, 400);
   win.set_position(win_pos_center);

   IF NOT win.Set_Icon_From_File("logo_interface_ada.jpg")
         THEN RAISE LOADING_ERROR ;
   END IF ; 




   -- Création de la grille
   Gtk_New(grid);
   grid.set_row_spacing(10); -- Espace entre les rangées
   grid.set_column_spacing(10); -- Espace entre les colonnes
   grid.set_column_homogeneous(True);

   -- Création des boutons
   Gtk_New(bouton1);
   bouton1.set_label("File");
   Gtk_New(bouton2);
   bouton2.set_label("Compile");
   Gtk_New(bouton3);
   bouton3.set_label("Run");

   -- Création de la zone de texte
   Gtk_New(scrolled_win);  -- Ajout d'une fenêtre déroulante pour la zone de texte
   scrolled_win.set_vexpand(True);  -- Permet l'extension verticale
   Gtk_New(text_view);
   scrolled_win.add(text_view);  -- Ajout de la zone de texte dans la fenêtre déroulante
   grid.attach(scrolled_win, 0, 1, 3, 1);  -- La zone de texte prend toute la largeur (col 0 à col 2, row 1)


   -- Ajout des boutons à la grille avec leurs positions (ligne, colonne)
   grid.attach(bouton1, 0, 0, 1, 1);  -- Bouton 1 en haut à gauche (col 0, row 0)
   grid.attach(bouton2, 1, 0, 1, 1);  -- Bouton 2 en haut au milieu (col 1, row 0)
   grid.attach(bouton3, 2, 0, 1, 1);  -- Bouton 3 en haut à droite (col 2, row 0)


   -- Ajouter la grille à la fenêtre
   win.add(grid);

   -- Action liee aux boutons 
   bouton1.On_Clicked (On_Button_Clicked'Access);
   bouton2.On_Clicked (On_Button_Clicked'Access);
   bouton3.On_Clicked (On_Button_Clicked'Access);

   -- Affichage de la fenêtre et des boutons
   win.show_all;

   -- Exécution de la boucle principale Gtk
   Main;

   exception 
  when loading_error => Put_Line("Erreur du chargement de l'icone");

end flexrisc_ide;

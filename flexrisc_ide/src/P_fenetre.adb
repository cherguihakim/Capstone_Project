WITH Gtk.Main ;          USE Gtk.Main ;
WITH Callbacks ;       USE Callbacks ;
with Ada.Text_IO; use Ada.Text_IO;


PACKAGE BODY P_Fenetre IS

   PROCEDURE Initialize(F : IN OUT T_Fenetre) IS

   BEGIN
      Init ;
      Gtk_New(GTK_Window(F.Win),Window_Toplevel) ;
      F.Win.Set_Title("Fenetre") ;
      F.win.set_default_size(600,400) ;
      F.win.set_position(win_pos_center);

      Gtk_New_With_Mnemonic(F.bouton_file, "File") ;
      Gtk_New_With_Mnemonic(F.bouton_burn, "Burn") ;
      Gtk_New_With_Mnemonic(F.bouton_reset, "Reset") ;



      Gtk_New(F.Lbl,"No file selected") ;

      --Gtk_New_Vbox(F.Box) ;
      --F.Box.Pack_Start(F.Lbl) ;
      --F.Box.Pack_Start(F.Btn) ;
      --F.Win.Add(F.Box) ;

      -- Création de la grille
   Gtk_New(GTK_Grid(F.grid));
   F.grid.set_row_spacing(10); -- Espace entre les rangées
   F.grid.set_column_spacing(10); -- Espace entre les colonnes
   F.grid.set_column_homogeneous(True);

   --Creation de la zone de texte 
   --Gtk_New(user_text);
   --user_text.set_placeholder_text("Enter your text here...");  -- Texte indicatif

   -- Ajout des boutons à la grille avec leurs positions (ligne, colonne)
   F.grid.attach(F.bouton_file, 0, 0, 1, 1);  -- Bouton 1 en haut à gauche (col 0, row 0)
   F.grid.attach(F.bouton_burn, 1, 0, 1, 1);  -- Bouton 2 en haut au milieu (col 1, row 0)
   F.grid.attach(F.bouton_reset, 2, 0, 1, 1);  -- Bouton 3 en haut à droite (col 2, row 0)
  -- grid.attach(user_text, 0, 1, 3, 1);    -- Zone de texte en dessous des boutons (col 0 à 2, row 1)

  -- Ajout du label en dessous des boutons
   F.grid.attach(F.Lbl, 0, 1, 3, 1);

   --Initialisation de File name a une chaine vide 
   --F.File_Name := "";


   -- Ajouter la grille à la fenêtre
   F.win.add(F.grid);


      Connect(F.Win, "destroy", Stop_Program'ACCESS) ;
      Connect(F.bouton_file, "clicked", Run'ACCESS, F) ;
      Connect(F.bouton_reset, "clicked", Reseting'ACCESS, F) ;

      F.Win.Show_all ;
   END Initialize ;

END P_Fenetre ;
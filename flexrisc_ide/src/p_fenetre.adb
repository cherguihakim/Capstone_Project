with Gtk.Main;              use Gtk.Main;
with Callbacks;             use Callbacks;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Gtkada;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Gtk.Handlers;


package body P_Fenetre
is
   F : Fenetre_T;

   package SU renames Ada.Strings.Unbounded;

   function "+" (Str : String) return SU.Unbounded_String
   is (SU.To_Unbounded_String (Str));

   function "+" (U_Str : SU.Unbounded_String) return String
   is (SU.To_String (U_Str));

   procedure Set_File_Name (File_Name : String) is
   begin
      F.File_Name := +File_Name;
      F.Lbl.set_text ("You selected : " & File_Name);
      Ada.Text_IO.Put_Line ("File_Name : " & F.File_Name'Image);
   end Set_File_Name;

   function Get_File_Name return String is
      begin
      -- Convertir le Unbounded_String en String
      return SU.To_String(F.File_Name);
   end Get_File_Name;

   procedure Initialize is
   begin
      Init;
      --Création de la fenetre
      Gtk_New (GTK_Window (F.Win), Window_Toplevel);
      F.Win.Set_Title ("Fenetre");
      F.win.set_default_size (600, 400);
      F.win.set_position (win_pos_center);

      --Création des boutons
      Gtk_New_With_Mnemonic (F.bouton_file, "File");
      Gtk_New_With_Mnemonic (F.bouton_burn, "Burn");
      Gtk_New_With_Mnemonic (F.bouton_reset, "Reset");


      --Initialisation du label
      Gtk_New (F.Lbl, "No file selected");

      -- Création de la grille
      Gtk_New (GTK_Grid (F.grid));
      F.grid.set_row_spacing (10); -- Espace entre les rangées
      F.grid.set_column_spacing (10); -- Espace entre les colonnes
      F.grid.set_column_homogeneous (True);

      -- Ajout des boutons à la grille avec leurs positions (ligne, colonne)
      F.grid.attach
        (F.bouton_file,
         0,
         0,
         1,
         1);  -- Bouton 1 en haut à gauche (col 0, row 0)
      F.grid.attach
        (F.bouton_burn,
         1,
         0,
         1,
         1);  -- Bouton 2 en haut au milieu (col 1, row 0)
      F.grid.attach
        (F.bouton_reset,
         2,
         0,
         1,
         1);  -- Bouton 3 en haut à droite (col 2, row 0)

      -- Ajout du label en dessous des boutons
      F.grid.attach (F.Lbl, 0, 1, 3, 1);

      -- Ajouter la grille à la fenêtre
      F.win.add (F.grid);

      Connect (F.Win, "destroy", Stop_Program'ACCESS);
      Connect (F.bouton_file, "clicked", Run'Access);
      Connect (F.bouton_reset, "clicked", Reseting'ACCESS, F);
      Connect(F.bouton_burn, "clicked", Prog_FPGA'ACCESS, F) ;

      F.Win.Show_all;
   end Initialize;

end P_Fenetre;

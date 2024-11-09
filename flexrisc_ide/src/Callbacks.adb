WITH Gtk.Main ;                USE Gtk.Main ;
WITH Gtk.Label ;                 USE Gtk.Label ;
with Gtkada.File_Selection; use Gtkada.File_Selection;
WITH Ada.Strings.Fixed; USE Ada.Strings.Fixed;
WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Command_Line; USE Ada.Command_Line;
WITH Ada.Directories;
WITH Interfaces.C.Strings; USE Interfaces.C.Strings;

PACKAGE BODY Callbacks IS


   PROCEDURE Stop_Program(Emetteur : access Gtk_widget_Record'class) IS
      PRAGMA Unreferenced (Emetteur );
   BEGIN
      Main_Quit;
   END Stop_Program ;


   PROCEDURE Reseting(Emetteur : ACCESS GTK_Widget_Record'Class ;
                         F : T_Fenetre) IS
      PRAGMA Unreferenced(Emetteur ) ;
   BEGIN
      F.Lbl.set_text("No files selected");
   END Reseting;

   PROCEDURE Run(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) IS 

   Local_File_Name : String := Gtkada.File_Selection.File_Selection_Dialog;
   pragma Unreferenced (Emetteur);

   begin
    if Local_File_Name /= "" then
        F.Lbl.set_text("You selected : " & Local_File_Name);
    end if;

    Ada.Text_IO.Put_Line("Le texte du label est : " & Local_File_Name);
   end Run;

   PROCEDURE Prog_FPGA(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) IS 
   File_Name : constant String := F.Lbl.Get_Text;
   Prefix    : constant String := "You selected : ";
   Command   : String(1..256) ;

   BEGIN 
   -- Étape 2 : Construire la commande Quartus
   --Command := "quartus_pgm -c USB-Blaster -m jtag -o ""p;" & File_Name & """";

   -- Affiche la commande pour vérifier
   Ada.Text_IO.Put_Line("Commande : " & File_Name);

   END;

END Callbacks ;
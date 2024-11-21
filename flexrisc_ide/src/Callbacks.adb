WITH Gtk.Main ;                USE Gtk.Main ;
WITH Gtk.Label ;                 USE Gtk.Label ;
with Gtkada.File_Selection; use Gtkada.File_Selection;
WITH Ada.Strings.Fixed; USE Ada.Strings.Fixed;
WITH Ada.Text_IO; USE Ada.Text_IO;
with System.Strings; use System.Strings;
with GNAT.OS_Lib; use GNAT.OS_Lib;
WITH Ada.Strings.Unbounded; USE Ada.Strings.Unbounded;


PACKAGE BODY Callbacks IS
   Package SU renames Ada.Strings.Unbounded;

   Function "+" (str : String ) return SU.Unbounded_String IS
      (SU.To_Unbounded_String (str) );

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

   PROCEDURE Run(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre_Access) IS 

   Local_File_Name : String := Gtkada.File_Selection.File_Selection_Dialog;
   pragma Unreferenced (Emetteur);

   begin
   F.File_Name := +Local_File_Name;
    if Local_File_Name /= "" then
        F.Lbl.set_text("You selected : " & Local_File_Name);
    end if;

    Ada.Text_IO.Put_Line("Le texte du label est : " & Local_File_Name);

   end Run;

   PROCEDURE Prog_FPGA(Emetteur : ACCESS GTK_Widget_Record'Class ; F : T_Fenetre) IS 
   Program_Name : constant String := "quartus_pgm";
   File_sof : constant String := "C:\Users\Hakim\Downloads\terasic_de2_115.sof";
   Commande : String := "quartus_pgm -c USB-Blaster -m JTAG -o ""p;C:\Users\Hakim\Downloads\terasic_de2_115.sof""";
    -- Construction des arguments explicites
   Arguments : Argument_List := (
      new String'("-c"),
      new String'("USB-Blaster"),
      new String'("-m"),
      new String'("JTAG"),
      new String'("-o"),
      new String'("""p;C:\Users\Hakim\Downloads\terasic_de2_115.sof""")
   );

   Result : Integer;

   BEGIN 
   -- Exécuter la commande système
   Result := GNAT.OS_Lib.Spawn (Program_Name => Program_Name,
                                Args => Arguments
                                );

   if Result = 0 then
      Put_Line ("Command successful");
   else
      Put_Line ("Unable to execute the command");
   end if;

   END;

END Callbacks ;
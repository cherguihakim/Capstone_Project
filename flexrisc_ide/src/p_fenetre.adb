with Gtk.Main;              use Gtk.Main;
with Callbacks;             use Callbacks;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Gtkada;
with Gtkada.File_Selection; use Gtkada.File_Selection;
with Gtk.Handlers;
with Gtk.Enums;             use Gtk.Enums;
with Gtk.Style_Context;     use Gtk.Style_Context;
with Gtk.Scrolled_Window;   use Gtk.Scrolled_Window;


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
      --F.Lbl.set_text ("You selected : " & File_Name);
      Ada.Text_IO.Put_Line ("File_Name from procedure set : " & F.File_Name'Image);
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
      F.Win.Set_Title ("FlexRISC IDE");
      F.win.set_default_size (1000, 400);
      F.win.set_position (win_pos_center);

      -- Create the main vertical box that contains Top_Grid, Main_Box (left & right), and Bottom_Grid
      Gtk_New(F.Main_Box, Orientation_Vertical, 10);
      F.Win.Add(F.Main_Box);

       -- Création de la grille
      Gtk_New (GTK_Grid (F.Top_Grid));
      F.Top_Grid.set_row_spacing (10); -- Espace entre les rangées
      F.Top_Grid.set_column_spacing (10); -- Espace entre les colonnes
      F.Top_Grid.set_column_homogeneous (True);

      --Création des boutons
      Gtk_New_With_Mnemonic(F.Bouton_File, "File");
      Gtk_New_With_Mnemonic(F.Bouton_Burn, "Burn");
      Gtk_New_With_Mnemonic(F.Bouton_Reset, "Reset");
      
       --Initialisation du label
      Gtk_New(F.Lbl, "No file selected");

      F.Top_Grid.Attach(F.Bouton_File, 0, 0, 1, 1);
      F.Top_Grid.Attach(F.Bouton_Burn, 1, 0, 1, 1);
      F.Top_Grid.Attach(F.Bouton_Reset, 2, 0, 1, 1);
      F.Top_Grid.Attach(F.Lbl, 0, 1, 3, 1);
      
      F.Main_Box.Pack_Start(F.Top_Grid, False, False, 10);

      -- Main horizontal box with two equal-sized sections for file history and board info
      DECLARE
         Horizontal_Box : Gtk_Box;
      BEGIN
         Gtk_New(Horizontal_Box, Orientation_Horizontal, 10);

         -- Left Box for file history
         Gtk_New(F.Left_Box, Orientation_Vertical, 5);
         Gtk_New(F.History_Title, "File History");
         Gtk_New(F.File_History);
         Gtk_New(F.Scroll);                   -- Scrollable window for file history
         F.Scroll.Set_Policy(Policy_Automatic, Policy_Automatic);
         F.Scroll.Add(F.File_History);
         F.Left_Box.Pack_Start(F.History_Title, False, False, 5);
         F.Left_Box.Pack_Start(F.Scroll, True, True, 5);
         Horizontal_Box.Pack_Start(F.Left_Box, True, True, 5);

         -- Right Box for FlexRisc board information
         Gtk_New(F.Right_Box, Orientation_Vertical, 5);
         Gtk_New(F.Board_Info_Label, "FlexRisc Board Information");  -- Placeholder label
         F.Right_Box.Pack_Start(F.Board_Info_Label, False, False, 5);
         Horizontal_Box.Pack_Start(F.Right_Box, False, True, 5);
         
         -- Detailed board information text
           -- ASCII-style title at the top of the board information section
         DECLARE
            ASCII_Title : Gtk_Label;
            ASCII_Title_Text : constant String :=
               "        ///////  //        ////// //    //            /////   //  //////  //////" & ASCII.LF &
               "      //         //        //        //  //            //   //  //  //        //    " & ASCII.LF &
               "    ///////  //        //////       //            /////    //  //////  //     " & ASCII.LF &
               "  //         //        //             //  //       //   //  //        //  //     " & ASCII.LF &
               "//         //////  //////        //    //     //   //  //  //////  ///////";
               
         BEGIN
            Gtk_New(ASCII_Title, ASCII_Title_Text);
            ASCII_Title.Set_Line_Wrap(True);
            ASCII_Title.Set_Max_Width_Chars(40);
            F.Right_Box.Pack_Start(ASCII_Title, False, False, 5);
         END;
         -- Create a label for the board information text with wrapped content
         Gtk_New(F.Board_Info_Text, "Flexible FPGA-Based RISC-V Platform" & ASCII.LF &
                         "Project Overview:" & ASCII.LF &
                         "This project develops a versatile, FPGA-based RISC-V platform" & ASCII.LF &
                         "with an 'Arduino-like' approach, bridging hardware and software" & ASCII.LF &
                         "engineering. Supervised by Olivier Henley with Ada programming " & ASCII.LF &
                         "resources provided by AdaCore." & ASCII.LF & ASCII.LF &
                         "Key Components:" & ASCII.LF &
                         "- FPGA: Xilinx Artix-7 XC7A75T, 64-bit RISC-V (Noel-V) core." & ASCII.LF &
                         "- Memory Options: HyperRAM, MRAM, and DDR4." & ASCII.LF &
                         "- IO Flexibility: IO Matrix Multiplexer for customizable pin assignments." & ASCII.LF &
                         "- Ada Firmware: Configures FPGA and board settings dynamically." & ASCII.LF & ASCII.LF &
                         "Objectives:" & ASCII.LF &
                         "1. Configurable platform with adaptable IO." & ASCII.LF &
                         "2. Develop Ada firmware for FPGA configuration." & ASCII.LF &
                         "3. Design with an 'Arduino-like' modularity." & ASCII.LF & ASCII.LF &
                         "Publication & Presentation:" & ASCII.LF &
                         "Project components will be published as Alire crates and presented" & ASCII.LF &
                         "at the GNAT Academic Program (GAP) workshop, along with highlights" & ASCII.LF &
                         "on AdaCore's blog and social media."
            );
          -- Enable line wrapping for the text
         F.Board_Info_Text.Set_Line_Wrap(True);  -- Enable wrapping within the box width

         -- Add Board_Info_Text to Right_Box
         F.Right_Box.Pack_Start(F.Board_Info_Label, False, False, 5);  -- Title label
         F.Right_Box.Pack_Start(F.Board_Info_Text, True, True, 5);     -- Wrapped text

         -- Add the horizontal box to the main vertical box
         F.Main_Box.Pack_Start(Horizontal_Box, True, True, 10);
      END;

       -- Bottom Grid for the progress bar
      Gtk_New(F.Bottom_Grid);
      --Gtk_New(F.Progress);                -- Initialize the progress bar
      --Bottom_Grid.Attach(F.Progress, 0, 0, 1, 1);
      F.Main_Box.Pack_Start(F.Bottom_Grid, False, False, 10);


      Connect (F.Win, "destroy", Stop_Program'ACCESS);
      Connect (F.bouton_file, "clicked", Run'Access, F);
      Connect (F.bouton_reset, "clicked", Reseting'ACCESS, F);
      Connect(F.bouton_burn, "clicked", Prog_FPGA'ACCESS, F) ;

      F.Win.Show_all;
   end Initialize;

end P_Fenetre;

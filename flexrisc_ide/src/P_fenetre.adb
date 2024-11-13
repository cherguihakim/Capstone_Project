WITH Gtk.Main; USE Gtk.Main;
WITH Callbacks; USE Callbacks;
with Gdk.RGBA; use Gdk.RGBA;
with Gtk.Enums; use Gtk.Enums;
with Gtk.Style_Context; use Gtk.Style_Context;
WITH Gtk.Scrolled_Window; USE Gtk.Scrolled_Window;  -- For scrollable list

PACKAGE BODY P_Fenetre IS

   PROCEDURE Initialize(F : IN OUT T_Fenetre) IS
      Main_Box : Gtk_Box;              -- Main container with left and right sections
      Left_Box : Gtk_Box;              -- Left container for file history
      Right_Box : Gtk_Box;             -- Right container for text
      Top_Grid : Gtk_Grid;             -- Top grid for buttons and label
      Bottom_Grid : Gtk_Grid;          -- Bottom grid for progress bar
      
      Scroll : Gtk_Scrolled_Window;  -- Declare scrolled window for File History
      History_Title : Gtk_Label;      -- Title label for the file history section
      Board_Info_Label : Gtk_Label;    -- Placeholder label for FlexRisc board information
      Board_Info_Text : Gtk_Label;     -- Detailed information label for FlexRisc board


   BEGIN
      Init;
      -- Create the main window
      Gtk_New(GTK_Window(F.Win), Window_Toplevel);
      F.Win.Set_Title("FlexRISC IDE");
      F.Win.Set_Default_Size(600, 400);
      F.Win.Set_Position(Win_Pos_Center);

      -- Create the main vertical box that contains Top_Grid, Main_Box (left & right), and Bottom_Grid
      Gtk_New(Main_Box, Orientation_Vertical, 10);
      F.Win.Add(Main_Box);

      -- Top Grid: for buttons and label
      Gtk_New(Top_Grid);
      Top_Grid.Set_Row_Spacing(10);
      Top_Grid.Set_Column_Spacing(10);
      Top_Grid.Set_Column_Homogeneous(True);
      Gtk_New_With_Mnemonic(F.Bouton_File, "File");
      Gtk_New_With_Mnemonic(F.Bouton_Burn, "Burn");
      Gtk_New_With_Mnemonic(F.Bouton_Reset, "Reset");
      Gtk_New(F.Lbl, "No file selected");
      Top_Grid.Attach(F.Bouton_File, 0, 0, 1, 1);
      Top_Grid.Attach(F.Bouton_Burn, 1, 0, 1, 1);
      Top_Grid.Attach(F.Bouton_Reset, 2, 0, 1, 1);
      Top_Grid.Attach(F.Lbl, 0, 1, 3, 1);
      Main_Box.Pack_Start(Top_Grid, False, False, 10);

      -- Main horizontal box with two equal-sized sections for file history and board info
      DECLARE
         Horizontal_Box : Gtk_Box;
      BEGIN
         Gtk_New(Horizontal_Box, Orientation_Horizontal, 10);

         -- Left Box for file history
         Gtk_New(Left_Box, Orientation_Vertical, 5);
         Gtk_New(History_Title, "File History");
         Gtk_New(F.File_History);
         Gtk_New(Scroll);                   -- Scrollable window for file history
         Scroll.Set_Policy(Policy_Automatic, Policy_Automatic);
         Scroll.Add(F.File_History);
         Left_Box.Pack_Start(History_Title, False, False, 5);
         Left_Box.Pack_Start(Scroll, True, True, 5);
         Horizontal_Box.Pack_Start(Left_Box, True, True, 5);

         -- Right Box for FlexRisc board information
         Gtk_New(Right_Box, Orientation_Vertical, 5);
         Gtk_New(Board_Info_Label, "FlexRisc Board Information");  -- Placeholder label
         Right_Box.Pack_Start(Board_Info_Label, False, False, 5);
         Horizontal_Box.Pack_Start(Right_Box, False, True, 5);
         
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
            Right_Box.Pack_Start(ASCII_Title, False, False, 5);
         END;
         -- Create a label for the board information text with wrapped content
         Gtk_New(Board_Info_Text, "Flexible FPGA-Based RISC-V Platform" & ASCII.LF &
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
         Board_Info_Text.Set_Line_Wrap(True);  -- Enable wrapping within the box width

         -- Add Board_Info_Text to Right_Box
         Right_Box.Pack_Start(Board_Info_Label, False, False, 5);  -- Title label
         Right_Box.Pack_Start(Board_Info_Text, True, True, 5);     -- Wrapped text

          
         -- Add the horizontal box to the main vertical box
         Main_Box.Pack_Start(Horizontal_Box, True, True, 10);
      END;
  
   

       -- Bottom Grid for the progress bar
      Gtk_New(Bottom_Grid);
      Gtk_New(F.Progress);                -- Initialize the progress bar
      Bottom_Grid.Attach(F.Progress, 0, 0, 1, 1);
      Main_Box.Pack_Start(Bottom_Grid, False, False, 10);


      -- Set up button events
      Connect(F.Win, "destroy", Stop_Program'ACCESS);
      Connect(F.Bouton_File, "clicked", Run'ACCESS, F);
      Connect(F.Bouton_Reset, "clicked", Reseting'ACCESS, F);

      -- Show everything in the window
      F.Win.Show_All;
   END Initialize;

END P_Fenetre;
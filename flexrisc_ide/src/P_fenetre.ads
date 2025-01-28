with Gtk.Window;       use Gtk.Window;
with Gtk.Enums;        use Gtk.Enums;
with Gtk.Button;       use Gtk.Button;
with Gtk.Label;        use Gtk.Label;
with Gtk.Box;          use Gtk.Box;
with Gtk.Widget;       use Gtk.Widget;
with Gtk.Grid;         use Gtk.Grid;
with Ada.Finalization; use Ada.Finalization;
with Gtk.Handlers;
with File_History;
with Gtk.Scrolled_Window; use Gtk.Scrolled_Window;
with Gtk.List_Box;      use Gtk.List_Box;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package P_Fenetre is

   type Fenetre_T is new Controlled with record
      Win                                    : Gtk_Window;
      bouton_file, bouton_burn, bouton_reset : Gtk_Button;
      Lbl                                    : Gtk_Label;
      File_Name                              : Unbounded_String;
      File_History                           :Gtk_List_Box;

      Main_Box                               : Gtk_Box;              -- Main container with left and right sections
      Left_Box                               : Gtk_Box;              -- Left container for file history
      Right_Box                              : Gtk_Box;             -- Right container for text
      Top_Grid                               : Gtk_Grid;             -- Top grid for buttons and label
      Bottom_Grid                            : Gtk_Grid;          -- Bottom grid for progress bar to be added
      
      Scroll                                 : Gtk_Scrolled_Window;  -- Declare scrolled window for File History
      History_Title                          : Gtk_Label;      -- Title label for the file history section
      Board_Info_Label                       : Gtk_Label;    -- Placeholder label for FlexRisc board information
      Board_Info_Text                        : Gtk_Label; 
      
   end record;

   procedure Initialize;

   package P_Handlers is new Gtk.Handlers.Callback (Gtk_Widget_Record);
   use P_Handlers;

   package P_UHandlers is new
     Gtk.Handlers.User_Callback (Gtk_Widget_Record, Fenetre_T);
   use P_UHandlers;

   procedure Set_File_Name (File_Name : String);
   function Get_File_Name return String;

end P_Fenetre;

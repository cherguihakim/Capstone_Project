WITH Gtk.Main ;       USE Gtk.Main ; 
WITH Gtk.Window ;     USE Gtk.Window ; 
WITH Gtk.Enums ;      use Gtk.Enums;


procedure Flexrisc_Ide is

win : Gtk_window ;

BEGIN
   Init ; 
   Gtk_New(Win) ;
   win.set_title("Interface Ada");
   win.set_default_size(600,400);
   win.set_position(win_pos_center);
   Win.show_all ; 
   Main ; 
   
end Flexrisc_Ide;

WITH Gtk.Main ;          USE Gtk.Main ;
WITH P_Fenetre ;         USE P_Fenetre ;


PROCEDURE flexrisc_ide IS
   F     : T_Fenetre_Access := new T_Fenetre ;
   pragma Unreferenced(F) ;
BEGIN
   Main ;
END flexrisc_ide ;
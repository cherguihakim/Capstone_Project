with Ada.Text_IO; use Ada.Text_IO;

package body Progress_Bar_Control is

   procedure Initialize_Progress_Bar (Progress : out Gtk.Progress_Bar.Gtk_Progress_Bar) is
   begin
      Gtk.New(Progress);
      Gtk.Progress_Bar.Set_Fraction(Progress, 0.0);
   end Initialize_Progress_Bar;

   procedure Update_Progress (Progress : Gtk.Progress_Bar.Gtk_Progress_Bar; Fraction : Gdouble) is
   begin
      Gtk.Progress_Bar.Set_Fraction(Progress, Fraction);
      Ada.Text_IO.Put_Line("Progress updated to " & Fraction'Image);
   end Update_Progress;

end Progress_Bar_Control;
with Gtk.Progress_Bar;

package Progress_Bar_Control is
   procedure Initialize_Progress_Bar (Progress : out Gtk.Progress_Bar.Gtk_Progress_Bar);
   procedure Update_Progress (Progress : Gtk.Progress_Bar.Gtk_Progress_Bar; Fraction : Gdouble);
end Progress_Bar_Control;
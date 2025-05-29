#!/usr/bin/env python3

import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GLib

def close_window():
    Gtk.main_quit()
    return False

w = Gtk.Window()
w.set_decorated(False)
w.set_skip_taskbar_hint(True)
w.set_skip_pager_hint(True)
w.set_keep_above(True)
w.set_type_hint(Gdk.WindowTypeHint.UTILITY)

# Make window nearly invisible (transparent background, small size)
w.set_app_paintable(True)
w.set_size_request(1, 1)
w.connect("realize", lambda win: GLib.timeout_add(1, close_window))

w.show_all()
Gtk.main()

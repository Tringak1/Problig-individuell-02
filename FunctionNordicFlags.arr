use context essentials2021

fun nordic-flag(background :: String, cross_outer :: String, cross_inner :: String):
  square-size = 10
  width = 22 * square-size
  height = 16 * square-size
  rect-background = rectangle(width, height, "solid", background)
  
  cross-outer-vertical = rectangle(4 * square-size, 16 * square-size, "solid", cross_outer)
  cross-outer-horizontal = rectangle(22 * square-size, 4 * square-size, "solid", cross_outer)
  
  cross-inner-vertical = rectangle(2 * square-size, 16 * square-size, "solid", cross_inner)
  cross-inner-horizontal = rectangle(22 * square-size, 2 * square-size, "solid", cross_inner)
  
  overlay-1 = overlay-xy(cross-outer-vertical, -6 * square-size, 0, rect-background)
  
  overlay-2 = overlay-xy(cross-outer-horizontal, 0, -6 * square-size, overlay-1)
  
  
  overlay-3 = overlay-xy(cross-inner-vertical, -7 * square-size, 0, overlay-2)
  
  overlay-4 = overlay-xy(cross-inner-horizontal, 0, -7 * square-size, overlay-3)
  
  frame(overlay-4)

  
end

# Norway
nordic-flag("red", "white", "blue")
# Denmark
nordic-flag("red", "red", "white")
# Finland
nordic-flag("white", "blue", "blue")
# Iceland
nordic-flag("blue", "white", "red")
# Sweden
nordic-flag("blue", "yellow", "yellow")
# Pharoe Islands
nordic-flag("white", "blue", "red")



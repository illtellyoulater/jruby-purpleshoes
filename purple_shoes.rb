# beware this code is about 2ys old.

# purple shoes is shoes for jruby using java swt widget gui library
# command line is: jruby --1.9 -S pshoes -h

require 'purple_shoes'

xspeed, yspeed = 1, 1
xdir, ydir = 1, 1

Shoes.app width: 300, height: 300 do
  a = nil
  button('pause'){a.pause}
  button('stop'){a.stop}
  img = image File.join(DIR, '../static/purple_shoes-icon.png') do
    alert "You're soooo quick!"
  end

  x, y = 150, 150
  size = [128, 128]
  pause = 0

  a = animate(40, false) do |n|
    unless pause == n
      x += xspeed * xdir
      y += yspeed * ydir

      xdir *= -1 if x > 300 - size[0] or x < 0
      ydir *= -1 if y > 300 - size[1] or y < 0

      img.move x.to_i, y.to_i
    end
    pause = n
  end
end
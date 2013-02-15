require 'tk'

def draw_brick_lines(dots_array, canvas)

  start_at = dots_array[0][:start_at]
          x =      dots_array.length - 1
  for i in 1..x do
    direction =            dots_array[i].keys[0]
    distance =              dots_array[i].values[0]
    start_at = draw_brick_line(start_at, direction, distance, canvas)
  end
end

def draw_brick_line(start_at, direction, distance, canvas)
  case direction
    when :right
      to_right(start_at, distance, canvas)
      return [start_at[0] + distance, start_at[1]]
    when :down
      to_down(start_at, distance, canvas)
      return [start_at[0], start_at[1] + distance]
    when :left
      to_left(start_at, distance, canvas)
      return [start_at[0] - distance, start_at[1]]
    when :up
      to_up(start_at, distance, canvas)
      return [start_at[0], start_at[1] - distance]

  end
end

def to_right(start_at, distance, canvas)
    for i in 0..distance
      draw_brick(start_at[0] + i, start_at[1], canvas)
    end
end

def to_down(start_at, distance, canvas)
  for i in 0..distance
    draw_brick(start_at[0], start_at[1] + i, canvas)
  end
end

def to_left(start_at, distance, canvas)
  for i in 0..distance
    draw_brick(start_at[0] - i, start_at[1], canvas)
  end
end

def to_up(start_at, distance, canvas)
  for i in 0..distance
    draw_brick(start_at[0], start_at[1] - i, canvas)
  end
end

def draw_brick(x, y, canvas)
  brick_width = 11
  brick_height = 11
  cell_width = 15
  cell_height = 15

  TkcRectangle.new(canvas,(x-1)*cell_width,(y-1)*cell_height,(x-1)*cell_width+brick_width,(y-1)*cell_height+brick_height).fill 'black'
end

title_text='snake'
root=TkRoot.new{title title_text}
c=TkCanvas.new(root, :width => 640, :height => 640)

c.pack
#head

draw_brick_lines([{:start_at => [2,2]},
                  {:right => 30},
                  {:down => 30}, {:left => 30}, {:up => 30}
                 ], c)


x = 10
y = 10

moving_brick = draw_brick x, y, c

root.bind("Key-Right"){
  moving_brick.delete() #TODO delete()以后，相应的对象是否会被自动回收，以避免内存溢出
  x = x + 1
  moving_brick = draw_brick x, y, c
}
root.bind("Key-Down"){
  moving_brick.delete()
  y = y + 1
  moving_brick = draw_brick x, y, c
}
root.bind("Key-Left"){
  moving_brick.delete()
  x = x - 1
  moving_brick = draw_brick x, y, c
}
root.bind("Key-Up"){
  moving_brick.delete()
  y = y - 1
  moving_brick = draw_brick x, y, c
}

Tk.mainloop
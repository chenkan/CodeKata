require 'tk'

title_text='snake'
root=TkRoot.new{title title_text}
c=TkCanvas.new(root)
c.pack
#head

draw_brick_lines([:start_at => [1,1], :right => 99, :down => 99, :left => 99, :up => 99])

TkcRectangle.new(c,0,0,10,10).fill 'black'

Tk.mainloop


def draw_brick_lines(dots_array)

  start_at = dots_array[0][:start_at]

  for i in 1..dots_array.length - 1 do
    dirction =            dots_array[i].keys[0]
    distance =              dots_array[i].values[0]
    start_at = draw_brick_line(start_at, dirction, distance)
  end
end

def draw_brick_line(start_at, direction, distance)
  case direction
    when :right
      line = [start_at[0]..start_at[0]+distance, start_at[1]]
    when :down
      line = [start_at[0], start_at[1]..start_at[1]+distance]
    when :left
      line = [start_at[0]..start_at[0]-distance, start_at[1]]
    when :up
      line = [start_at[0], start_at[1]..start_at[1]-distance]

  end

  if line[0].class == Array
     for i in line[0] do
       draw_brick()
     end
end

  brick_width = 10
   brick_height = 10

  reture end_at
end
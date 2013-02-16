require 'tk'

def draw_brick_lines(dots_array, canvas)

  bricks = []

  start_at = dots_array[0][:start_at]
          x =      dots_array.length - 1
  for i in 1..x do
    direction =            dots_array[i].keys[0]
    distance =              dots_array[i].values[0]
    tmp = draw_brick_line(start_at, direction, distance, canvas)
    start_at = [tmp[0],tmp[1]]
    bricks = bricks + tmp[2]
  end
  bricks
end

def draw_brick_line(start_at, direction, distance, canvas)
  case direction
    when :right
      return [start_at[0] + distance, start_at[1], to_right(start_at, distance, canvas)]
    when :down
      return [start_at[0], start_at[1] + distance, to_down(start_at, distance, canvas)]
    when :left
      return [start_at[0] - distance, start_at[1], to_left(start_at, distance, canvas)]
    when :up
      return [start_at[0], start_at[1] - distance, to_up(start_at, distance, canvas)]
  end
end

def to_right(start_at, distance, canvas)
  bricks = []
    for i in 0..distance
      bricks.push draw_brick(start_at[0] + i, start_at[1], canvas)
    end
  bricks
end

def to_down(start_at, distance, canvas)
  bricks = []
  for i in 0..distance
    bricks.push draw_brick(start_at[0], start_at[1] + i, canvas)
  end
  bricks
end

def to_left(start_at, distance, canvas)
  bricks = []
  for i in 0..distance
    bricks.push draw_brick(start_at[0] - i, start_at[1], canvas)
  end
  bricks
end

def to_up(start_at, distance, canvas)
  bricks = []
  for i in 0..distance
    bricks.push draw_brick(start_at[0], start_at[1] - i, canvas)
  end
  bricks
end

def draw_brick(x, y, canvas)
  brick_width = 11
  brick_height = 11
  cell_width = 15
  cell_height = 15

  TkcRectangle.new(canvas,(x-1)*cell_width,(y-1)*cell_height,(x-1)*cell_width+brick_width,(y-1)*cell_height+brick_height).fill 'black'
end

def modify_snake(move_direction, snake)
  if snake[1].keys[0] == :left || snake[1].keys[0] == :right

  end

  # 处理蛇的第一节
  case move_direction
    when :right
      case snake[1].keys[0]
        when :left
          snake[1][:left] = snake[1].values[0] + 1
        when :right
          snake[1][:left] = snake[1].values[0] + 1
        else
          snake.insert 1, {:left => 1}
      end
      snake[0][:start_at] = [snake[0][:start_at][0] + 1, snake[0][:start_at][1]]
    when :down
      case snake[1].keys[0]
        when :down
          snake[1][snake[1].keys[0]] = snake[1].values[0] + 1
        when :up
          snake[1][snake[1].keys[0]] = snake[1].values[0] + 1
        else
          snake.insert 1, {:up => 1}
      end
      snake[0][:start_at] = [snake[0][:start_at][0], snake[0][:start_at][1] + 1]
    when :left
      case snake[1].keys[0]
        when :left
          snake[1][snake[1].keys[0]] = snake[1].values[0] + 1
        when :right
          snake[1][snake[1].keys[0]] = snake[1].values[0] + 1
        else
          snake.insert 1, {:right => 1}
      end
      snake[0][:start_at] = [snake[0][:start_at][0] - 1, snake[0][:start_at][1]]
    when :up
      case snake[1].keys[0]
        when :down
          snake[1][:down] = snake[1].values[0] + 1
        when :up
          snake[1][:down] = snake[1].values[0] + 1
        else
          snake.insert 1, {:down => 1}
      end
      snake[0][:start_at] = [snake[0][:start_at][0], snake[0][:start_at][1] - 1]
  end

  #if snake.length <= 2
  #  return snake
  #end

  # 处理蛇的最后一节
  x = snake.length - 1
  if snake[x].values[0] == 1
      snake = snake.reverse.drop(1).reverse
  else
    snake[x][snake[x].keys[0]] = snake[x].values[0] - 1
  end
  return snake
end

title_text='snake'
root=TkRoot.new{title title_text}
c=TkCanvas.new(root, :width => 640, :height => 640)

c.pack
#head
# TODO 折线的描述方式很有问题
draw_brick_lines([{:start_at => [2,2]},
                  {:right => 30},
                  {:down => 30},
                  {:left => 30},
                  {:up => 30}
                 ], c)


snake = [{:start_at => [10,10]},
         {:left => 9}]

@snake_bricks = draw_brick_lines snake, c


root.bind("Key-Right"){
  @snake_bricks.each {|x|x.delete()} #TODO delete()以后，相应的对象是否会被自动回收，以避免内存溢出
  snake = modify_snake :right, snake
  puts snake
  @snake_bricks = draw_brick_lines snake, c
}
root.bind("Key-Down"){
  @snake_bricks.each {|x|x.delete()}
  snake = modify_snake :down, snake
  puts snake
  @snake_bricks = draw_brick_lines snake, c
}
root.bind("Key-Left"){
  @snake_bricks.each {|x|x.delete()}
  snake = modify_snake :left, snake
  puts snake
  @snake_bricks = draw_brick_lines snake, c
}
root.bind("Key-Up"){
  @snake_bricks.each {|x|x.delete()}
  snake = modify_snake :up, snake
  puts snake
  @snake_bricks = draw_brick_lines snake, c
}

Tk.mainloop
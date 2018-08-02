defmodule RobotSimulator do
  defstruct direction: nil, position: nil

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  def create() do
    create(nil,nil)
  end
  def create({_, _}=position) do
    create(nil, position)
  end
  def create(direction)  when direction in [:north, :south, :east, :west, :nil] do
    create(direction, nil)
  end
  def create(direction, nil) do
    create(direction, {0, 0})
  end
  def create(direction, {x, y}=position)
      when direction in [:north, :south, :east, :west, :nil] and
           is_integer(x) and
           is_integer(y) do
    %RobotSimulator{ direction: direction || :north , position: position }
  end
  def create(direction, _position) when direction in [:north, :south, :east, :west] do
    {:error, "invalid position"}
  end
  def create(_direction, _position) do
    {:error, "invalid direction"}
  end

#  def validinput() do
#  end
#  def directioncheck(direction) when direction in [:north, :south, :east, :west] do
#    direction
#  end
#  def directioncheck(direction) do
#    :error
#  end
#  def positioncheck() do
#
#  end



  @doc """
  Move ahead A left L or right R
  """
  def move(%RobotSimulator{direction: :north}=robot, "R") do
    %RobotSimulator{ robot | direction: :east }
  end
  def move(%RobotSimulator{direction: :east}=robot, "R") do
    %RobotSimulator{ robot | direction: :south }
  end
  def move(%RobotSimulator{direction: :south}=robot, "R") do
    %RobotSimulator{ robot | direction: :west }
  end
  def move(%RobotSimulator{direction: :west}=robot, "R") do
    %RobotSimulator{ robot | direction: :north }
  end


  def move(%RobotSimulator{direction: :north}=robot, "L") do
    %RobotSimulator{ robot | direction: :west }
  end
  def move(%RobotSimulator{direction: :east}=robot, "L") do
    %RobotSimulator{ robot | direction: :north }
  end
  def move(%RobotSimulator{direction: :south}=robot, "L") do
    %RobotSimulator{ robot | direction: :east }
  end
  def move(%RobotSimulator{direction: :west}=robot, "L") do
    %RobotSimulator{ robot | direction: :south }
  end


  def move(%RobotSimulator{direction: :north, position: {x, y}}=robot, "A") do
    %RobotSimulator{ robot | position: {x,y+1} }
  end
  def move(%RobotSimulator{direction: :south, position: {x, y}}=robot, "A") do
    %RobotSimulator{ robot | position: {x,y-1} }
  end
  def move(%RobotSimulator{direction: :east, position: {x, y}}=robot, "A") do
    %RobotSimulator{ robot | position: {x+1,y} }
  end
  def move(%RobotSimulator{direction: :west, position: {x, y}}=robot, "A") do
    %RobotSimulator{ robot | position: {x-1,y} }
  end

  def move(_robot, _invalidinstruction) do
    {:error, "invalid instruction"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  def prepinstruction_list(instructions) do
    String.graphemes(instructions)
  end

  def simulate(robot, instructions) do
    instructions
    |> prepinstruction_list
    |> Enum.reduce( robot, &move(&2, &1))
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  def position(robot) do
    robot.position
  end
end

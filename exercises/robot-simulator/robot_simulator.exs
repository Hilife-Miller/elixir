defmodule RobotSimulator do
  defstruct direction: nil, position: nil  
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  def create(direction \\ :north, position \\ {0, 0}) do
    %RobotSimulator{ direction: direction, position: position }
  end

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
  
  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  def simulate(robot, instructions) do
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

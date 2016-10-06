#requires ruby
require 'erb'
#to clean up words
require 'shellwords'

# Define a Robot class: A robot has a name
class Robot

attr_accessor :name

#OR def name
#   "Roberto"
# end
# OR self.name = name
  def initialize (value1)
    @name = value1
# try self.name*****
  end
# A robot instance should have a method called 'say_hi' and it should return "Hi!"
  def say_hi
    "Hi!"
  end

# A robot instance should have a method called 'say_name' and it should return "My name is X" where X is the robot's name
  def say_name(text="I'm Cray E E E E E E E E Z")
    "My name is #{self.name} #{text}."
#try removing .self******
  end
end

# Define a BendingUnit class
# A BendingUnit inherits from Robot
class BendingUnit < Robot

  # A bending unit instance has a method called 'bend'
  # The bend method has one argument??? 'objecttobend'
  # The bend method should put to the console "Bend X!" where X is objecttobend

  def bend (object_to_be_bent)
   "Bend #{object_to_be_bent}!"
  end

end
# Define an ActorUnit class
# An ActorUnit inherits from Robot
class ActorUnit < Robot

  # An ActorUnit instance has a method called 'change_name'
  # The 'changename' method accepts an argument 'newname'
  def change_name (newname)
# The 'changename' method changes the name property of the robot to 'newname'
    @name = newname
  end
end

# Output an index.html when running ruby robots.rb name> <object>. Said page should use a BendingUnit with a name of <name> and use that BendingUnit to say hi, say their name and bend <object> and output all the above to HTML at <robot_name>.
#html where <robot_name> is the <name> given on the command line.
bb88 = BendingUnit.new(ARGV[0])

object_to_be_bent = ARGV[1]

new_file = File.open("./#{ARGV[0]}.html", "w+")

# push new file, read html file
new_file << ERB.new(File.read("index.html.erb")).result(binding)

# close file
new_file.close

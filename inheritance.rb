require 'byebug'

class Employee
  attr_accessor :boss, :salary, :name

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    #debugger
    @employees.inject(0) do |sum, employee|
      sum += employee.salary * multiplier
     if employee.is_a?(Manager)
       sum += employee.bonus(multiplier)
     end
     sum
    end0
  end
end

david = Employee.new("David", "TA", 10_000, nil)
shawna = Employee.new("Shawna", "TA", 12_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, nil, [shawna, david])
ned = Manager.new("Ned", "Founder", 1_000_000, nil, [darren])

darren.boss = ned
shawna.boss = david.boss = darren

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

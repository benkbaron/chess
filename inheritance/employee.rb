class Employee

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  attr_reader :salary, :name

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end

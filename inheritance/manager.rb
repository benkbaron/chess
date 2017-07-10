require_relative 'employee'

class Manager < Employee
  attr_reader :sub_employees
  def initialize(name, salary, sub_employees)
    super(name, salary)
    @sub_employees = sub_employees
  end

  def bonus(multiplier)
    sub_salaries = sub_employees.reduce(0) { |acc, employee| acc + employee.salary }
    sub_salaries * multiplier
  end

end

require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup_2)
        self.funding > startup_2.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            name = Employee.new(name, title)
            @employees << name
        else
            raise "title does not exist"
        end
    end

    def size
        return self.employees.length
    end

    def pay_employee(employee_instance)
        payment = salaries[employee_instance.title]
        if funding >= payment
            employee_instance.pay(payment)
            @funding -= payment
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        avg = sum / self.size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |title, salary|
            if !self.salaries.keys.include?(title)
                @salaries[title] = salary
            end
        end
        other_startup.employees.each do |employee|
            @employees << employee
        end

        other_startup.close
    end
end

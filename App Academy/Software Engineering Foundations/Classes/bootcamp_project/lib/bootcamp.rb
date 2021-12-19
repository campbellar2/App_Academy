class Bootcamp
    #PART 1
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    #getters
    def name
        @name
    end
    def slogan
        @slogan
    end
    def teachers
        @teachers
    end
    def students
        @students
    end

    #setters
    def hire(new_teacher)
        teachers << new_teacher
    end

    def enroll(new_student)
        if students.length < @student_capacity
            students << new_student
            return true
        end
        false
    end
    def enrolled?(student)
        students.include?(student)
    end

    #PART 2
    def student_to_teacher_ratio
        ratio = (@students.length / @teachers.length)
        return ratio
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        if self.enrolled?(student) && self.num_grades(student) > 0
            avg = @grades[student].sum / num_grades(student)
        else
            return nil
        end
    end
end

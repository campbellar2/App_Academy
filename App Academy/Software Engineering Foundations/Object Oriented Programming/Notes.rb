#### Object Oriented Programming Notes ####

# Abstraction And Encapsulation Notes #

#Object Oriented Programming
#Object Oriented Programming is a design pattern developers use when building applications. 
#You've been using this design pattern through the last few sections, but now let's truly adopt an object oriented mindset.

#The goal of OOP is to create programs using objects that interact with each other. 
#We implement classes to create those objects. 
#Let's take a look at 2 pillars of OOP: Abstraction and Encapsulation.

#Abstraction
#In OOP, abstraction is the process of exposing essential features of an object while hiding inner details that are not necessary to using the feature. 
#Take this analogy: Many drivers do not understand the mechanical details of how a steering wheel works, but they can still use the steering wheel to drive a car. 
#In a similar way, our classes should have methods that are simple to use because they hide complex logic inside of them. 
#Let's explore some examples.

#Below is a class that does not abstract how to enroll a student into a course:
class Course
    def initialize(name, teachers, max_students)
        @name = name
        @teachers = teachers
        @max_students = max_students
        @students = []
    end
  
    def max_students
        @max_students
    end
  
    def students
        @students
    end
end  
  
course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)
  
# Let's to enroll a student
if course.students.length < course.max_students
    course.students << "Alice"
end
#####
#Below is the class with a nicely abstracted #enroll method:
class Course
    def initialize(name, teachers, max_students)
        @name = name
        @teachers = teachers
        @max_students = max_students
        @students = []
    end
  
    def enroll(student)
        @students << student if @students.length < @max_students
    end
end  
  
course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)
  
# Let's to enroll a student
course.enroll("Alice")

#Abstraction results in code that is readable and easy to use. 
#There could be many steps that need to take place when a student is enrolled, 
#and a #enroll method can take care of all of them behind the scenes, unknown to the user of the class.

#We have been using this concept of abstraction all the time! 
#Array is a class and Array#include? is a method that we feel comfortable using although we do not know the exact implementation details within the method.


#Encapsulation
#Similar to abstraction, encapsulation closely relates methods and data attributes together with the hope of preventing misuse. 
#For us, the goal of encapsulation is to give users access to the things that are safe for them to use. 
#Some data we may choose to keep private or purposefully hide from outside users for the sake of security. 
#One common way to encapsulate data attributes is by making them only accessible through methods that we explicitly design as programmers!

#Here's some food for thought: Ruby classes have some level of encapsulation by default. 
#How so? Well, if we create a class with attributes, those attributes are inaccessible from the outside unless we define getter or setter methods too!

#Design your code in a way that safeguards against misuse! 
#Let's take a look at an example. 
#Say we wanted a class to track the order of people waiting in a line. 
#We call this concept a Queue. 
#The rules of a Queue are simple: if you are the first one in, then you are also the first one out. 
#No cutting the line! 
#More programmatically, we remove from the front of the line, but we add to the back of the line.

#We'll use the index 0 of an array to represent what is at the front of the line.

#Let's take a look at a properly encapsulated Queue class.
class Queue
    def initialize
        @line = []
    end
  
    def add(ele)
        @line << ele # add ele to back of line
        nil
    end
  
    def remove
        @line.shift  # remove front ele of line
    end
end
  
grocery_checkout = Queue.new
  
grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.remove          # => "bob"
grocery_checkout.add("noam")
grocery_checkout.add("donald")
grocery_checkout.remove          # => "alice"
grocery_checkout.remove          # => "noam"
grocery_checkout.remove          # => "donald"
  
# people who are added first to the line will leave first!
#You'll notice that above we decided to not include a getter for @line, that is because we shouldn't include a full getter. 
#If we give the user full access to the @line then we can't enforce any of our rules and the result is disastrous:
# this class fails to encapsulate
class Queue
    def initialize
        @line = []
    end
  
    def line
        @line
    end
  
    def add(ele)
        @line << ele # add ele to back of line
        nil
    end
  
    def remove
        @line.shift  # remove front ele of line
    end
end
  
grocery_checkout = Queue.new
  
grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.line.unshift("noam")   # noam cut the line!
grocery_checkout.remove                 # => "noam"

#Wrapping Up
#Abstraction and Encapsulation are just two pillars of OOP. 
#As you progress in your programming career, you'll learn how to support other pillars of object oriented programming! So stay tuned.

#####################

#Attribute Methods Notes

#Attribute Methods
#Let's learn some new methods that can clean up the way we write our classes. 
#So far in the course, we've had to manually implement getter and setter methods for our attributes. 
#Below is a class with some classic getter/setter methods that we'll refactor. 
#Using what we learned so far in the course:
class Dog
    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end
  
    # getters
    def name
        @name
    end
  
    def age
        @age
    end
  
    # setters
    def name=(new_name)
        @name = new_name
    end
  
    def age=(new_age)
        @age = new_age
    end
end

#attr_reader
#Creating getter methods for the attributes we want to expose is pretty repetitive. 
#Let's use a new method attr_reader, to create the getters for name and age automatically:
class Dog
    # attr_reader will define #name and #age getters for us
    attr_reader :name, :age
  
    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end
end
  
dog = Dog.new("Fido", 3, "pizza")
dog.name
dog.age
dog.favorite_food # NoMethodError: undefined method `favorite_food', because we didn't pass it to attr_reader

#Let's break down the new line above. 
#attr_reader is a built-in ruby method that we are calling inside of the Dog class. 
#Note that we don't call it within initialize. 
#attr_reader should be passed symbols that correspond to the names of the attributes we want to have getters for.

#In other words, when we have this call to attr_reader:
class MyClass
    attr_reader :attribute_1
    # ...
end
#It would result in this getter method being defined under the hood:
class MyClass
    # ...
    def attribute_1
        @attribute_1
    end
end
#Don't be thrown off by the syntax we use to call attr_reader. 
#By convention in Ruby, we omit the parentheses for attr methods. 
#However, attr_reader :name, :age is equivalent to the explicit attr_reader(:name, :age).

#attr_writer
#In a similar way, we can use attr_writer to define setter methods:
class Dog
    # attr_writer will define #name= and #age= setters for us
    attr_writer :name, :age
  
    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end
end
  
dog = Dog.new("Fido", 3, "pizza")
  
dog.name = "Spot"
dog.age += 1
  
p dog #<Dog:0x007fd87f1144a0 @age=4, @favorite_food="pizza", @name="Spot">
  
dog.favorite_food = "calzone" # NoMethodError: undefined method `favorite_food=', because we didn't pass it to attr_writer

#In other words, when we have this call to attr_writer:
class MyClass
    attr_writer :attribute_1
    # ...
end
#It would result in this setter method being defined under the hood:
class MyClass
    # ...
    def attribute_1=(new_val)
        @attribute_1 = new_val
    end
end

#attr_accessor
#Oftentimes, we may want both a getter and a setter for an attribute. 
#If we are in this scenario, we can use the attr_accessor method. 
#It is a combination of attr_reader and attr_writer in that it will create both getters and setters for the specified attributes.
class Dog
    # attr_accessor will define #name, #name=, #age, #age= methods for us
    attr_accessor :name, :age
  
    def initialize(name, age, favorite_food)
        @name = name
        @age = age
        @favorite_food = favorite_food
    end
end
  
dog = Dog.new("Fido", 3, "pizza")
  
# Let's use the setter and getter for name!
dog.name = "Spot"
p dog.name          # "Spot"

#Wrapping Up
#Awesome, our code looks much cleaner! However, be cautious. 
#Like we explored in our chat about encapsulation, don't just take all your class's attributes and pass them to attr_accessor. 
#Consider if a user of the class needs to manipulate that data with a raw getter or setter. 
#Or more importantly consider if it is safe for a user to do so. 
#Only use getters and setters for what you want to expose in your classes.

######################

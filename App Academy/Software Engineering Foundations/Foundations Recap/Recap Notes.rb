### Foundations Recap ###

# Spaceship Operator Notes

#Spaceship Operator <=>

#We can use the spaceship operator <=> to relatively compare two values. 
#Previously, we used the basic comparators of <, >, <=, >= to compare values, so what new behavior does the spaceship operator give us access to? 
##Well, you can think of <=> as an operation we can use to combine all of those basic comparators into one.

#Before we explore the spaceship operator, let's begin with some motivation. 
#Given two variables, a and b, what does the following expression tell you?
a < b   # => false
#Since the expression above evaluates to false, it can either be the case that "a is equal to b" or "a is greater than b". 
#If we need to know exactly which one is the case, a simple check using < won't be enough since the output only tells us that "a is not less than b". 
#However, we can use the spaceship operator to get an unambiguous signal to where a and b lie on the number line relative to each other.

#How it Works
#The spaceship operator <=> is used between two values and will return -1, 0, or 1. 
#The behavior is as follows:

#given the expression a <=> b
# it will return -1 if a is less than b
# it will return 0 if a is equal to b
# it will return 1 if a is greater than b

#Here are a few examples of spaceship operator being used to compare numbers:
7 <=> 2     # => 1
7 <=> 7     # => 0
2 <=> 7     # => -1
10 <=> 2    # => 1
-5 <=> 10   # => -1
-3 <=> -9   # => 1

############

#Nil as Falsey Notes

#At this point of the course, you are certainly comfortable using operations like || and && for boolean values, 
#but now let's explore how these operations can be used on other data types.

#Truthy and Falsey Values

#Our current understanding of || applies to the boolean values of true and false, so how can we use those operations on non-boolean values? 
#It is the case that every value in Ruby can be treated as true (truthy) or as false (falsey). 
#Remembering which values are truthy and which are falsey in Ruby is simple:
     #nil and false are the only falsey values
     #everything else is truthy

#Note that these rules for truthy vs falsey are specific to Ruby. 
#Other languages may differ in their truthy and falsey values. 
#For example, in JavaScript, the number 0 and the empty string "" are considered falsey as well. 
#This is not the case in Ruby.

#The implication of this is that we can use nil to act as false in scenarios that traditionally require the boolean:
val = nil
if val
    p "it is true"
else 
    p "it is false"
end

# The code above will print "it is false" since nil is a falsey value


###################################################################################


#What does logical OR really do?
#So far in the course, we've been thinking about how || works in a somewhat naive way. 
#You probably agree with following description of the expression a || b, where a and b are any values :
     #when at least one value is true, we return true
     #when both sides are false, we return false
#while "correct", this does not fully describe || in a way that shows it's full potential. 
#Here is a more complete description of how a || b behaves under the hood:
     #when a is truthy, return a
     #when a is falsey, return b


##############################################################################
#With this second description in mind, we can use || on any values:
true || 42          # => true
42 || true          # => 42
false || 42         # => 42
42 || false         # => 42
false || "hello"    # => "hello"
nil || "hello"      # => "hello"
"hi" || "hello"     # => "hi"
0 || true           # => 0
false || nil        # => nil

#Default Arguments
#Using the evaluation of || in this way is particularly useful when implementing default arguments for our methods. 
#Take the following code as an example:
def greet(person = nil)
     if person.nil?
          person = "you"
     end
 
     p "Hey " + person
end
 
greet("Brian")  # => "Hey Brian"
greet           # => "Hey you"

#We can refactor the conditional by utilizing || and the fact that nil is a falsey value:
def greet(person = nil)
     person = person || "you"
     p "Hey " + person
end
 
greet("Brian")  # => "Hey Brian"
greet           # => "Hey you"

#But wait, there's more! 
#We can utilize our classic shorthand. 
#We commonly write a += b in place of a = a + b. 
#In the same way, we can write a ||= b in place of a = a || b :
def greet(person = nil)
     person ||= "you"
     p "Hey " + person
end
 
greet("Brian")  # => "Hey Brian"
greet           # => "Hey you"

#You're probably wondering why we don't simply assign person = "you" directly in the parameter list for the method. 
#You are right! 
#We should make the code as succinct and to the point as possible using that syntax.
#We'll admit that this was an exercise in getting comfortable utilizing nil as a falsey value for use with ||. 
#But now that we are comfortable with this logic, we can implement default procs up next!

#Default Procs
#The ||= pattern is utilized heavily when implementing default procs:
def call_that_proc(val, &prc)
     prc ||= Proc.new { |data| data.upcase + "!!" }
     prc.call(val)
end
 
p call_that_proc("hey")                                             # => "HEY!!"
p call_that_proc("programmers") { |data| data * 3 }                 # => "programmersprogrammersprogrammers"
p call_that_proc("code") { |data| "--" + data.capitalize + "--"}    # => "--Code--"

#You'll notice that in the above code, we don't explicitly assign prc to be nil. 
#This is because prc will automatically contain nil if the method is called without passing in a proc.

#Lazy Initialization
#The ||= pattern is also useful when implementing Lazy Initialization for classes. 
#Lazy initialization is a design strategy where we delay creation of an object until it is needed. 
#The idea is to avoid slow or costly operations until they are absolutely necessary. 
#This contrasts with our typical classes that preemptively set all attributes up front. 
#For example, take this Restaurant class that initializes all attributes immediately:
class Restaurant
     attr_accessor :name, :chefs, :menu
 
     def initialize(name, chefs)
          @name = name
          @chefs = chefs
          @menu = ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
     end
end
 
five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])
p five_star_restaurant
#<Restaurant:0x00007fea7a8c6880 
# @name="Appetizer Academy", 
# @chefs=["Marta", "Jon", "Soon-Mi"],
# @menu=["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
#>

#While it is required that @name and @chefs must be assigned immediately in Restaurant#initialize since they are taken in as arguments, 
#it is not necessary that @menu be assigned immediately. 
#Imagine that @menu was a "costly" object like an array of 10,000 elements. 
#Initializing @menu may slow down the creation of the Restaurant. 
#To overcome this, we'll use the lazy initialization pattern to only create the @menu if someone asks for it. 
#In other words, we'll create the @menu in the Restaurant#menu getter if it does not exist already:
class Restaurant
     attr_accessor :name, :chefs, :menu
 
     def initialize(name, chefs)
          @name = name
          @chefs = chefs
     end
 
     def menu
          @menu ||= ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
     end
end
 
five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])
 
p five_star_restaurant
#<Restaurant:0x00007f90b3922368 
# @name="Appetizer Academy",
# @chefs=["Marta", "Jon", "Soon-Mi"]
#>
 
p five_star_restaurant.menu
#["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
 
p five_star_restaurant
#<Restaurant:0x00007f90b3922368
# @name="Appetizer Academy", 
# @chefs=["Marta", "Jon", "Soon-Mi"],
# @menu=["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
#>

#Above, notice how the restaurant lacks a @menu until we call the getter! 
#To accomplish this we leveraged the fact that a missing attribute will be nil. 
#That means we can use the ||= pattern!

#########################################

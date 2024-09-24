# test.jl

# Print a simple message
println("Hello, Julia!")

# Perform basic arithmetic
a = 10
b = 5
println("a + b = ", a + b)
println("a - b = ", a - b)
println("a * b = ", a * b)
println("a / b = ", a / b)

# # Define a simple function
# function greet(name)
#     return "Hello, $name!"
# end

# println(greet("World"))

# Test array operations
arr = [1, 2, 3, 4, 5]
println("Array: ", arr)
println("Sum of array: ", sum(arr))

# Test a simple loop
for i in 1:5
    println("Loop iteration: ", i)
end

# Test a conditional statement
if a > b
    println("a is greater than b")
else
    println("a is not greater than b")
end

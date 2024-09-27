using Random
using Optim
using Base.Threads

# Define the objective function
function rosenbrock(x)
    sum(100 * (x[2:end] .- x[1:end-1] .^ 2) .^ 2 .+ (1 .- x[1:end-1]) .^ 2)
end

# Number of variables
n = 1000  # Changed from 100 to 1000

# Initial guess
x0 = randn(n)

# Number of threads
nthreads = Threads.nthreads()

# Function to perform optimization
function optimize_task()
    result = optimize(rosenbrock, x0, BFGS())
    return result
end

# Run optimizations in parallel
results = Vector{Any}(undef, nthreads)
Threads.@threads for i in 1:nthreads
    results[i] = optimize_task()
end

# Print results
for i in 1:nthreads
    println("Thread $i result: ", results[i])
end
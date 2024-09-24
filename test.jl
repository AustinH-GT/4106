# benchmark.jl

using BenchmarkTools

# Function to perform a simple computation
function compute(n)
    sum = 0.0
    for i in 1:n
        sum += sqrt(i)
    end
    return sum
end

# Benchmark the compute function
n = 10^7
println("Benchmarking compute function with n = $n")
@btime compute($n)

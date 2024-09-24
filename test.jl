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

# Benchmark the compute function and measure in ops/sec
n = 10^7
println("Benchmarking compute function with n = $n")
result = @benchmark compute($n)
ops_per_sec = 1 / (median(result).time / 1e9)
println("Operations per second: $ops_per_sec")

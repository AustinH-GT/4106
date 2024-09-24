# benchmark.jl
using BenchmarkTools
using Base.Threads

# Function to perform a simple computation
function compute(n)
    sum = Threads.Atomic{Float64}(0.0)
    @threads for i in 1:n
        atomic_add!(sum, sqrt(i))
    end
    return sum[]
end

# Benchmark the compute function and measure in ops/sec
n = 10^7
println("Benchmarking compute function with n = $n")
result = @benchmark compute($n)
ops_per_sec = 1 / (median(result).time / 1e9)
println("Operations per second: $ops_per_sec")

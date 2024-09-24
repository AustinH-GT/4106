# benchmark.jl
using BenchmarkTools
using Base.Threads

# Function to perform the Sieve of Eratosthenes
function prime_sieve(n)
    is_prime = trues(n)
    is_prime[1] = false  # 1 is not a prime number
    sqrt_n = Int(sqrt(n))
    
    @threads for i in 2:sqrt_n
        if is_prime[i]
            for j in i*i:i:n
                is_prime[j] = false
            end
        end
    end
    
    return is_prime
end

# Benchmark the prime_sieve function and measure in numbers checked per second
n = 10^7
println("Benchmarking prime_sieve function with n = $n")
result = @benchmark prime_sieve($n)
numbers_checked_per_sec = n / (median(result).time / 1e9)
println("Numbers checked per second: $numbers_checked_per_sec")

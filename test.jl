using Base.Threads
using BenchmarkTools

# Sieve of Eratosthenes function
function sieve_of_eratosthenes(limit)
    is_prime = trues(limit)
    is_prime[1] = false
    for i in 2:floor(Int, sqrt(limit))
        if is_prime[i]
            for j in i^2:i:limit
                is_prime[j] = false
            end
        end
    end
    return is_prime
end

# Multithreaded prime sieve
function threaded_sieve(limit)
    chunk_size = ceil(Int, limit / nthreads())
    results = Vector{Bool}[]
    @threads for i in 1:nthreads()
        start = (i - 1) * chunk_size + 1
        stop = min(i * chunk_size, limit)
        push!(results, sieve_of_eratosthenes(stop)[start:stop])
    end
    return reduce(vcat, results)
end

# Benchmarking function
function benchmark_sieve(limit, duration)
    count = 0
    elapsed = 0.0
    while elapsed < duration
        t = @elapsed threaded_sieve(limit)
        elapsed += t
        count += limit
    end
    return count / elapsed
end

# Parameters
limit = 10^6
duration = 10.0  # seconds

# Run benchmark
println("Benchmarking prime sieve....")
primes_per_second = benchmark_sieve(limit, duration)
println("Processed $(primes_per_second) numbers per second.")

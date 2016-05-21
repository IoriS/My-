immutable my_lin_interp
    grid::Array
    vals::Array
end

function Base.call(points::my_lin_interp,x::Real)
    i = searchsortedlast(grid,x)
    if i == 0 || i == length(grid)
        return 0
    end
    
    interpolated_value = (x - grid[i])*(vals[i+1]-vals[i])/(grid[i+1]-grid[i])+vals[i]
    return interpolated_value 
end

function Base.call{T<:Real}(points::my_lin_interp,x::AbstractVector{T})
    n = length(x) 
    out = Array(Float64, n)
    for l in 1:n
        i = searchsortedlast(grid,x[l])
        if i == 0 || i == length(grid)
            out[l] = 0
        else
            out[l] = (x[l] - grid[i])*(vals[i+1]-vals[i])/(grid[i+1]-grid[i])+vals[i]
        end
    end
    
    return out
end

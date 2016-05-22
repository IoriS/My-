immutable my_lin_interp
    grid::Array
    vals::Array
end

function Base.call(points::my_lin_interp,x::Real)
    i = searchsortedlast(grid,x)
    k = searchsortedfirst(grid,x)
    if i == 0 || (i == length(grid) && k == length(grid) + 1)
        return 0
    end

    if i == length(grid) && k != length(grid) + 1
        return (vals[i])
    end
    
    interpolated_value = (x - grid[i])*(vals[i+1]-vals[i])/(grid[i+1]-grid[i])+vals[i]
    return interpolated_value 
end

function Base.call{T<:Real}(points::my_lin_interp,x::AbstractVector{T})
    n = length(x) 
    out = Array(Float64, n)
    for l in 1:n
        i = searchsortedlast(grid,x[l])
        k = searchsortedfirst(grid,x[l])
        if i == 0 || (i == length(grid) && k == length(grid)+1)
            out[l] = 0 
        elseif i == length(grid) && k != length(grid)+1
            out[l] = vals[i]
        else 
            out[l] = (x[l] - grid[i])*(vals[i+1]-vals[i])/(grid[i+1]-grid[i])+vals[i]
        end
    end
    
    return out
end

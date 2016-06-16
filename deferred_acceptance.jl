function deferred_acceptance(m_prefs,f_prefs)
    m = size(m_prefs, 2)
    n = size(f_prefs, 2)
    m_matched=zeros(Int64,m)
    f_matched=zeros(Int64,n)
    next_m_approach=ones(Int64,m)
    unchanged_counter = 0
    while unchanged_counter < m
        unchange_counter = 0
        for h in 1:m
            if m_matched[h] == 0
                d = m_prefs[next_m_approach[h],h]
                if d == 0
                    m_matched[h] = 0
                    unchanged_counter += 1
                elseif findfirst(f_prefs[:,d],h) < findfirst(f_prefs[:,d],f_matched[d])
                    if f_matched[d] != 0
                        m_matched[f_matched[d]]=0
                        next_m_approach[f_matched[d]] += 1
                    end
                    m_matched[h]=d
                    f_matched[d]=h
                else
                    next_m_approach[h] += 1
                end
            else unchanged_counter += 1 
            end
        end
    end
    print(m_matched,f_matched)
end
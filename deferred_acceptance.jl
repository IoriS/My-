function deferred_acceptance(m_prefs,f_prefs)
    m = size(m_prefs, 2)
    n = size(f_prefs, 2)
    m_matched=zeros(Int64,m)
    f_matched=zeros(Int64,n)
    for d in 1:n+1
        for h in 1:m
            if m_matched[h]==0
                if m_prefs[d,h] == 0
                    m_matched[h] = 0
                    elseif findfirst(f_prefs[:,m_prefs[d,h]],h) > findfirst(f_prefs[:,m_prefs[d,h]],f_matched[m_prefs[d,h]])
                    if f_matched[m_prefs[d,h]] != 0
                        m_matched[f_matched[m_prefs[d,h]]] = 0
                    end
                    m_matched[h]=m_prefs[d,h]
                    f_matched[m_prefs[d,h]]=h
                else m_matched[h]=0
                end 
            end
        end
    end
    print(m_matched,f_matched)
end
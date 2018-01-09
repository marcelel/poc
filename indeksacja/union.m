function tab_return = union(tab, p, q) 

tab_return = tab;
startIndex = p;
endIndex = q;
if p > q
    startIndex = q;
    endIndex = p;
end
    tab_return(root(tab, startIndex)) = root(tab, endIndex);

end
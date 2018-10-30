function mid_value = quantize(alpha,a,s)
%display(a)
%display(s)
d=(a+1)/s;
if(alpha>0)
mid_value = a/2+(d/2);
else
    mid_value = -a/2 +d/2;
end
for i=1:s
    l = (-a/2+(i-1)*d);
    u = (-a/2+i*d);
    if(alpha>=l && alpha<u)
        mid_value = (u+l)/2;
    end
end
end
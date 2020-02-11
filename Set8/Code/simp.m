function y = simp(a,b,n)
    h = (b-a)/n;
    x = [a:h:b];
    fx = atan(1+x.^2);
    sum=0;
    for i=1:length(x)
        sum = sum + 2*fx(i);
        if (rem(i,2)==0)
            sum=sum+2*fx(i);
        end
    end
    y= sum - fx(1) - fx(length(fx));
    y = (y*h)/3;
end
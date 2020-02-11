function v = bisection(R, ya, yb, err,B)

    while(abs(ya-yb) >= err)
       mid = (ya+yb)/2;
       nucya = nuclear(ya,R,B);
       nucmd = nuclear(mid,R,B);
       
       if(nucya * nucmd > 0)
           ya = mid;
       else
           yb = mid;
       end
       
    end
    v = mid;
end
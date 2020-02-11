function v = bisection(X, ha, hb, err, D)

    while(abs(ha-hb) >= err)
       mid = (ha+hb)/2;
       nucya = hydraulic(ha, X, D);
       nucmd = hydraulic(mid, X, D);
       
       if(nucya * nucmd > 0)
           ha = mid;
       else
           hb = mid;
       end
       
    end
    v = mid;
end
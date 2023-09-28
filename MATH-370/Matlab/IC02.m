%{
    METHOD: 
        B(0) = B_0
        I = r / N
        dB = I(bK) + M
        M_sum = sum(for m = 0:k -> term = (1 + I)^m)
        ------------------
        B(k+1) = B(k) + B
               = (1 + I)B(k) + M 
               = B_0*(1 + I)^(k + 1) + M_sum

    JANE:        
        r = 0.0625
        N = 12
        M = 200
        n = 40*12 = 480
        B(n) = (M/I)*((1+I)^n - 1)

    KAREN:
        r = 0.0625
        N = 12
        M = 200
        n = 20*12 = 240
        B(n) = (M/I)*((1+I)^n - 1)

%}
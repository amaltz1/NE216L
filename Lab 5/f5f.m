function dw = f5f( t, w )
    a1 =  0.3;
    a2 = -0.1;
    a3 =  0.5;
    a4 =  0.8;
    b  =  1.0;
 
    c1 =  0.2;
    c2 = -0.6;
    c3 =  0.4;
    c4 =  0.7;
    d  =  0.9;
    %letting du/dt = x = w(2), dv/dt = y = w(4), u = w(1), v = w(3)

    dw = [w(2)
        b - (a1 *w(1) + a2*w(2) + a3*w(3) + a4*w(4))
        w(4)
        d - (c1*w(1) + c2 * w(2) + c3*w(3) + c4*w(4))];
end
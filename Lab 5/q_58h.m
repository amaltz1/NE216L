[t5f, y5f] = dp45( @f5f, [0, 40], [1, .5, .2, .1]', 0.01, 1e-8 );
figure
plot(t5f,y5f(1,:), 'r');
hold on
plot(t5f,y5f(3,:), 'b'); %only need u and v which are indic
title('amaltz and hd2patel')
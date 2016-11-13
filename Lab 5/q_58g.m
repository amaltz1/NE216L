[t5e, y5e] = dp45( @f5e, [0, 20], [1/2.0616851, 0]', 0.01, 1e-8 );
figure
plot(t5e,y5e(1,:), 'r'); %only need x(t)
title('amaltz and hd2patel')
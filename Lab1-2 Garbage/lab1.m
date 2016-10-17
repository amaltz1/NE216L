x = 0;
withdrawal = -1;
attempts = 0;
disp('Welcome to the Aubrey Maltz Bank.')
while (x ~= 1234) & (attempts <3) 
    x = input('Please input your PIN:');
    
    if x ~= 1234
        disp('Incorrect PIN, please retry')
    else
        disp('Correct PIN, prepare to withdraw')
    end
   
end

while ((withdrawal < 0) | (withdrawal > 200)) &  x == 1234
    withdrawal = input('How much to withdraw? ');
    if withdrawal < 0
        disp('Invalid negative input, please retry.')
    elseif withdrawal > 200
        disp('Insufficient funds, please retry.')
    else
        z= ['Cash withdrawn successfully. Here is your money.']; 
        disp(z)
    end
end
    


       

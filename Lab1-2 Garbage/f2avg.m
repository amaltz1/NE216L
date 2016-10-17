%use diff and int to find average value of a function
clc
clear all

syms x
f(x) = x^3 + 2*x;
f2(x) = diff(f,x,2);

a = 0;

b= 1;

% apply average value of second derivative formula 
f2av(x) = int(f2(x), x, a,b)/ (b-a)



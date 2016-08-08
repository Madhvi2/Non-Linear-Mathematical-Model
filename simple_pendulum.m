function f = simple_pendulum( t,y )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    %k=631;
    k=2;
    f(1)=y(2);
    f(2)= -k *(y(1));
    f=f';


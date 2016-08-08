function [ f ] = Duffing_oscillator( t,y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    epsilon=0.1;
    f(1)=y(2);
    f(2)=-y(1)-epsilon*y(1)^3;
f=f';


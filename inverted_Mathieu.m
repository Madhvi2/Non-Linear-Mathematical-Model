function [ f ] = inverted_Mathieu( t,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    a_delta=9.36;b_epsilon=3.41;
    
    f(1)=y(2);
    f(2)=-(a_delta+(b_epsilon*cos(t)))*y(1);

f=f';


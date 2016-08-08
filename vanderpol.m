function [ f ] = vanderpol( t,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 epsilon=100;
 f(1)=y(2);
 f(2)=-epsilon*(y(1)^2-1)*y(2)-y(1);

f=f';


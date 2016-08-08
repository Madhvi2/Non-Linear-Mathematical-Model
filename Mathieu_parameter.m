function f = Mathieu_parameter(t,y,a_alpha,b_beta)
a=a_alpha;
b=b_beta;
f(1)=y(2);
f(2)=-(a+(b*cos(t)))*y(1);
f=f';

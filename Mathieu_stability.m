clear all;clc;
syms d e;
A=[d e/2 0 0;e d-1 e/2 0;0 e/2 d-4 e/2;0 0 e/2 d-9];
B=[d-1 e/2 0 0;e/2 d-4 e/2 0;0 e/2 d-9 e/2; 0 0 e/2 d-16];
C=[d-1/4+e/2 e/2 0 0;e/2 d-9/4 e/2 0;0 e/2 d-25/4 e/2;0 0 e/2 d-49/4];
D=[d-1/4-e/2 e/2 0 0;e/2 d-9/4 e/2 0;0 e/2 d-25/4 e/2;0 0 e/2 d-49/4];
value_e=0:0.2:6;
result=[];
for i=1:length(value_e)
    temp=det(A);
    temp1=subs(temp,{e},value_e(i));
    re=sym2poly(temp1);
    format long g;
    value=roots(re);
    for j =1:length(value)
        result=[result;value(j) value_e(i)];
    end
    temp=det(B);
    temp1=subs(temp,{e},value_e(i));
    re=sym2poly(temp1);
    format long g;
    value=roots(re);
    for j =1:length(value)
        result=[result;value(j) value_e(i)];
    end
    temp=det(C);
    temp1=subs(temp,{e},value_e(i));
    re=sym2poly(temp1);
    format long g;
    value=roots(re);
    for j =1:length(value)
        result=[result;value(j) value_e(i)];
    end
    temp=det(D);
    temp1=subs(temp,{e},value_e(i));
    re=sym2poly(temp1);
    format long g;
    value=roots(re);
    for j =1:length(value)
        result=[result;value(j) value_e(i)];
    end
end 
axis([-5,20,0,6]);hold on;xlabel('\delta','FontSize',30,'FontName','MS Reference Sans Serif');ylabel('\epsilon','FontSize',30,'FontName','MS Reference Sans Serif');title('Stability Diagram of Inverted Pendulum','FontSize',20,'FontName','MS Reference Sans Serif');
plot(result(:,1),result(:,2),'o','LineWidth',2);grid on;
% To plot the stability chart or strut diagram for the Mathieu's Equation
% Mathieu Equation is x''+(d-2ecos(2t))x = 0
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Warning : On running this the workspace memory will be deleted. Save if
% any data present before running the code !!
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%--------------------------------------------------------------------------
% Code written by : Siva Srinivas Kolukula                                |
%                   Senior Research Fellow                                |
%                   Structural Mechanics Laboratory                       |
%                   Indira Gandhi Center for Atomic Research              |
%                   India                                                 |
% E-mail : allwayzitzme@gmail.com                                         |
%--------------------------------------------------------------------------
% Version 1 : 28 Feb 2012

% Version 2: 24 July 2013
% Made code to plot stability chart in few seconds
%
clc ; clear all ;
N = 5 ;                    % Order of the Hill's Determinant
T = cell(1,4) ;             % Cell array to store Hill determinant matrices
EE = cell(1,4) ;
epsilon=-6:0.2:6;
%epsilon=-20:0.05:20;
%epsilon = -15:0.05:15 ;
for i = 1:length(epsilon)
    e = epsilon(i) ;
    a = e*ones(N,1) ;       % Sub diagonal elements
    c = e*ones(N,1) ;       % Super diagonal elements
    % Hill determinants for odd sine and cosine coefficients 
    ndeto = 2*N+1 ;     
    bo = (1:2:ndeto).^2 ;   % Diagonal elements
    T1 = diag(a,-1)+diag(bo)+diag(c,+1) ; 
    T1(1,1) = 1+e ;
    T{1} = T1 ;             % Odd cosine determinant matrix
    T1(1,1) = 1-e ;
    T2 = T1 ;
    T{2} = T2 ;             % Odd sine determinant matrix
    % Hill determinants for even sine and cosine coefficients
    ndete = 2*(N+1) ;
    be = (2:2:ndete).^2 ;   % Diagonal elements
    T3 = diag(a,-1)+diag(be)+diag(c,+1) ;
    T{3} = T3 ;             % Even cosine determinant matrix
    T4 = zeros(size(T3)) ;
    T4(1,1) = 0 ;T4(1,2) = e ;T4(2,1) = 2*e ;
    T4(2:end,2:end)=T3(1:end-1,1:end-1) ;
    T{4} = T4 ;             % Even sine determinant matrix
    % Calculate the Eigenvalues of the Determinant matrices
    for j = 1:4
        E = eig(T{j}) ;
        % plot(E,e,'.','Markersize',4.5,'Color','r') ;
        EE{j}(:,i) = E ;
    end
end
epsilon = epsilon' ;
E1 = EE{1}' ;
E2 = EE{2}' ;
E3 = EE{3}';
E4 = EE{4}' ;
E = [E1 E2 E3 E4] ;
%figure ;
plot(E,epsilon,'k','Linewidth',2);
%plot(E,epsilon,'ko');
title('Stability diagram for Mathieu Equation','FontSize',16)
xlabel('\delta=g/w^2l','FontSize',20) ;
ylabel('\epsilon=A/l','FontSize',20) ;
grid on;
hold on ;
%axis([-100,100,-10,60]);

axis([-5,12,-6,6]);
%axis([-20,20,-30,30]);
%axis([-20,20,-10,10]);
%axis([-10,45,-30,30]);
%PlotAxisAtOrigin 
% freq_calculated=[];
% for i=1:length(epsilon)
%     for j=1:length(E(i,:))
%         Fs = 10;
%         tspan=(0:1/Fs:100);
%         b=epsilon(i,:);
%         a=E(i,j);
%         [t,y] = ode45(@(t,y) Mathieu(t,y,a,b),tspan,[0.1,0.1]);
%         Fs=100;
%         L= length(y(:,1));
%         Y=fft(y(:,1),L);
%         Ya=(abs(Y)./length(Y)).^2;
%         [max_value,index]=sort(Ya,'descend');
%         freq_required=max_value(1,1);
%         freq_calculated=[freq_calculated;freq_required epsilon(i,1)];       
%     end
% end


value_w=[];
value_w1=[];
result1=[];
result2=[];
result3=[];
result4=[];
result5=[];
result6=[];
result7=[];
result8=[];


% 
% for i=1:length(E(:,1))
%     for j=1:length(E(i,:))
%         temp_w=sqrt(((2*9.8)/E(i,j)));
%         if((isreal(temp_w))==1)
%             value_w=[value_w;temp_w]; 
%             if((0<=temp_w)&(temp_w<=0.5))
%                 result1=[result1;temp_w epsilon(i,1)];
%             elseif((0.5<temp_w)&(temp_w<=1))
%                 result2=[result2;temp_w epsilon(i,1)];
%             elseif((1<temp_w)&(temp_w<2.5))
%                 result3=[result3;temp_w epsilon(i,1)];
%             elseif((2.5<=temp_w)&(temp_w<=3.5))
%                 result4=[result4;temp_w epsilon(i,1)];
%             elseif((3.5<temp_w)&(temp_w<=5))
%                 result5=[result5;temp_w epsilon(i,1)];
%            else
%                 result6=[result6;temp_w epsilon(i,1)];
%             end
%         end
%     end
% end
% plot(result1(:,1),result1(:,2),'+');hold on
% plot(result2(:,1),result2(:,2),'m+');hold on
% plot(result3(:,1),result3(:,2),'r+');hold on
% plot(result4(:,1),result4(:,2),'g+');hold on
% plot(result5(:,1),result5(:,2),'c+');hold on
% plot(result6(:,1),result6(:,2),'k+');hold on

clear all;
clc;
a_alpha=[0:0.01:5];
b_beta=[0:0.5:6];
final_result=[];
for i=1:length(a_alpha)
    for j=1:length(b_beta)
        Fs = 10;
        %[t,y]=ode45('Mathieu_parameter',(0:1/Fs:100),[1.0 0.1],1,1);
        [t,y]=ode45(@(t, y)Mathieu_parameter(t, y, a_alpha(i),b_beta(j)), (0:1/Fs:100), [1,0.1]);
        Fs=100;
        L= length(y(:,1));
        Y=fft(y(:,1),L);
        Ya=(abs(Y)./length(Y)).^2;
        [max_value,index]=sort(Ya,'descend');
        l = linspace(0,length(Y)-1,length(Y))./length(Y);
        freq_required1=l(index(1,1));
        freq_required2=l(index(2,1));
        %freq_required1=freq_required1*Fs; 
        %freq_required2=freq_required2*Fs;
        final_result=[final_result;freq_required1 b_beta(j);freq_required2 b_beta(j)];
        
    end
end
close all
clear
clc
%% part1
S1=load("S6_2.mat");
emg_train=S1.emg_train;
rep_train=S1.repetition_train;
stimul_train=S1.stimulus_train;
len=length(emg_train);
k=1;
i=1;
X=[];
while i<len
    flag=0;
if i+999<len 
    if rep_train(i)~=0 && rep_train(i+999)~=0
        X(k:k+999,1:16)=emg_train(i:i+999,1:16);
        X(k:k+999,17)=rep_train(i);
        X(k:k+999,18)=stimul_train(i);
        i=i+1300;
        k=k+1000;
        flag=1;
    end
end
if flag==0
   i=i+1;
end

end
writematrix(X,'S6_Data_train.xlsx');
%% part 2
emg_test=S1.emg_test;
rep_test=S1.repetition_test;
stimul_test=S1.stimulus_test;
len=length(emg_test);
Y=[];
k=1;
i=1;

while i<len
    flag=0;
if i+999<len 
    if rep_test(i)~=0 && rep_test(i+999)~=0
        Y(k:k+999,1:16)=emg_test(i:i+999,1:16);
        Y(k:k+999,17)=rep_test(i);
        Y(k:k+999,18)=stimul_test(i);
        i=i+1300;
        k=k+1000;
        flag=1;
    end
end
if flag==0
   i=i+1;
end

end
writematrix(Y,'S6_Data_test.xlsx');
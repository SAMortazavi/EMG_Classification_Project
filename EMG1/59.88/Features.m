close all
clear 
clc
%% part 1
S_number=1;
while S_number<11
myfilename= sprintf('S%i_Data_train.xlsx',S_number); %file names as 1.data, 2.data and so on.;
Data=readtable(myfilename);
Data=table2array(Data);
Data_len=length(Data);
window_len=19;
X=[];
Y=[];
row=1;
for i=1:20:Data_len
    k=1;
    for j=1:16
    Data_Mean=mean(Data(i:i+window_len,j));
    Data_std=std(Data(i:i+window_len,j));
    Data_RMS=rms(Data(i:i+window_len,j));
    X(row,k)=Data_Mean;
    X(row,k+1)= Data_std;
    X(row,k+2)= Data_RMS;
    k=k+3;
    end
    Y(row,1)=Data(i,18);
    row=row+1;
    
end
if S_number==1
    writematrix(X,'X_Train.xlsx');
    writematrix(Y,'Y_Train.xlsx');
else
    writematrix(X,'X_Train.xlsx','WriteMode','append');
    writematrix(Y,'Y_Train.xlsx','WriteMode','append');
end
S_number=S_number+1;
end
%% part 2
S_number=1;
while S_number<11
myfilename= sprintf('S%i_Data_test.xlsx',S_number); %file names as 1.data, 2.data and so on.;
Data=readtable(myfilename);
Data=table2array(Data);
Data_len=length(Data);
window_len=199;
X=[];
Y=[];
row=1;
for i=1:200:Data_len
    k=1;
    for j=1:16
    Data_Mean=mean(Data(i:i+window_len,j));
    Data_std=std(Data(i:i+window_len,j));
    Data_RMS=rms(Data(i:i+window_len,j));
    X(row,k)=Data_Mean;
    X(row,k+1)= Data_std;
    X(row,k+2)= Data_RMS;
    k=k+3;
    end
    Y(row,1)=Data(i,18);
    row=row+1;
    
end
if S_number==1
    writematrix(X,'X_Test.xlsx');
    writematrix(Y,'Y_Test.xlsx');
else
    writematrix(X,'X_Test.xlsx','WriteMode','append');
    writematrix(Y,'Y_Test.xlsx','WriteMode','append');
end
S_number=S_number+1;
end

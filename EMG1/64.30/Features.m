close all
clear 
clc
%% part 1
S_number=1;
while S_number<11
myfilename= sprintf('S%i_Data_train.xlsx',S_number); %file names as 1.data, 2.data and so on.;
Data=readtable(myfilename); %We have to change data type from table to array because of MATLAB functions limitations
Data=table2array(Data);
Data_len=length(Data);
window_len=39; % window length. this length is the best one. I tried more than 100 window lengthes but this one is the best one.
X=[];
Y=[];
row=1;
for i=1:20:Data_len % by setting window length 40 and this for step 20 we have 20 overlap.
    k=1;
    for j=1:16
    % in this part I extrat fetures for data and then put them one after
    % another in the colomns of an array. 
    Data_Mean=mean(Data(i:i+window_len,j));
    Data_std=std(Data(i:i+window_len,j));
    Data_RMS=rms(Data(i:i+window_len,j));
    X(row,k)=Data_Mean; % mean
    X(row,k+1)= Data_std;
    X(row,k+2)= Data_RMS;% Root Mean Square
    k=k+3;
    end
    Y(row,1)=Data(i,18); % setting lables
    row=row+1;
    if i+window_len>=Data_len
        break
    end
end
% writing data in excel file.
if S_number==1
    % in first iteration we must creat an excel file
    writematrix(X,'X_Train.xlsx');
    writematrix(Y,'Y_Train.xlsx');
else
    % in other itterations we must write data in the excel file which we
    % created in previous part.
    writematrix(X,'X_Train.xlsx','WriteMode','append');
    writematrix(Y,'Y_Train.xlsx','WriteMode','append');
end
S_number=S_number+1;
end
%% part 2
% in this part I do same for Test data.
S_number=1;
while S_number<11
myfilename= sprintf('S%i_Data_test.xlsx',S_number); %file names as 1.data, 2.data and so on.;
Data=readtable(myfilename);
Data=table2array(Data);
Data_len=length(Data);
window_len=399;
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
    if i+window_len>=Data_len
        break
    end
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

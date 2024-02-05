close all
clear 
clc
%% part 1
% in this part I load data and train model.
X_Train=readtable("X_Train.xlsx");
X_Train=table2array(X_Train);
Y_Train=readtable("Y_Train.xlsx");
Y_Train=table2array(Y_Train);
SVMModel = fitcecoc(X_Train, Y_Train, 'Learners', templateSVM('Standardize', true,'BoxConstraint',0.99,'KernelFunction','polynomial'));
KNNModel = fitcknn(X_Train, Y_Train, 'Standardize', true, 'NumNeighbors', 5);
% in this part I set Standadize true because we have to make data stabdrad
% for Machine Learning models.
% and if we dont the model wont work appropraitely.
%% Part 2
% evaluating the model.
X_Test=readtable("X_Test.xlsx");
X_Test=table2array(X_Test);
Y_Test=readtable("Y_Test.xlsx");
Y_Test=table2array(Y_Test);
YTestPredicted = predict(SVMModel, X_Test);
confusion = confusionmat(Y_Test, YTestPredicted);
accuracy = sum(diag(confusion)) / sum(confusion(:));
YTestPredicted_KNN = predict(KNNModel, X_Test);
confusion_KNN = confusionmat(Y_Test, YTestPredicted_KNN);
accuracy_KNN = sum(diag(confusion_KNN)) / sum(confusion_KNN(:));
%% Part 3
figure;
subplot(1,2,1);
confusionchart(confusion);
title('SVM Confusion Matrix');

subplot(1,2,2);
confusionchart(confusion_KNN);
title('KNN Confusion Matrix');
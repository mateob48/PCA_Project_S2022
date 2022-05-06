function [Total_F,Total_M,ObsF,ObsM,trainF,testF,trainM,testM,actF,actM]=load_data()

TF = xlsread('Female_features.csv');
TM = xlsread('Male_features.csv');

Total_F = length(TF);
Total_M = length(TM);

TF(1,:) = [];
TM(1,:) = [];
actF = TF(:,59);
actM = TM(:,59);
TF(:,59) = [];
TM(:,59) = [];
ObsF = TF;
ObsM = TM;


% consequently, taking in consideration the new vectors obtained by the
% permutation, the train and test vectors are created by dividing vector in
% half, so that the 2fold cross validation can be performed.
trainF = ObsF(1:10000,:);% training X vector with 250 values 
testF = ObsF(10001:20000,:);% testing X vector with 250 values
trainM = ObsM(1:10000,:);% training X vector with 250 values 
testM = ObsM(10001:20000,:);% testing X vector with 250 values
end
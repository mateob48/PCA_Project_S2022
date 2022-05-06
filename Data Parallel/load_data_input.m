function [Total_F,Total_M,ObsF,ObsM,trainF,testF,trainM,testM]=load_data_input(up1, up2)

TF = xlsread('Female_features.csv');
TM = xlsread('Male_features.csv');

Total_F = length(TF);
Total_M = length(TM);

TF(1,:) = [];
TM(1,:) = [];
ObsF = TF;
ObsM = TM;

[rF,cF] = size(ObsF); %get the size of X
[rM,cM] = size(ObsM); %get the size of X

vectorF = randperm(rF); % permutation of the data
vectorM = randperm(rM); % permutation of the data

% the total number of rows and columns is obtained to be used in the
% creation of a vector of zeros that later is going to be filled with the
% data of the new permutated X and Y vectors.

NewF = zeros(rF,cF);% create a vector of zeros for the permutated data
NewM = zeros(rM,cM);% create a vector of zeros for the permutated data

% 2 for loops are created to fill the new vector with the permutated data
% and, therefore, creating two vector that can be used for the 2 fold cross
% validation. 
parfor i = 1:rF% for loop from 1 to the last value of X
   NewF(i,:) = ObsF(vectorF(i),:); % the permutated data is filled in the new X vector
   NewM(i,:) = ObsM(vectorM(i),:); % the permutated data is filled in the new X vector
end

% consequently, taking in consideration the new vectors obtained by the
% permutation, the train and test vectors are created by dividing vector in
% half, so that the 2fold cross validation can be performed.
trainF = NewF(1:up1,:);% training X vector with 250 values 
testF = NewF(up1+1:up2,:);% testing X vector with 250 values
trainM = NewM(1:up1,:);% training X vector with 250 values 
testM = NewM(up1+1:up2,:);% testing X vector with 250 values
end
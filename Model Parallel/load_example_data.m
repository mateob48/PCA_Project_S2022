function [Total_Obs,Obs,trainD,testD]=load_example_data()

T = xlsread('Female_features.csv');

Total_Obs = length(T);
T(1,:) = []; 
Obs = T;

[r1 c1] = size(Obs); %get the size of X

vectorX = randperm(r1); % permutation of the data

% the total number of rows and columns is obtained to be used in the
% creation of a vector of zeros that later is going to be filled with the
% data of the new permutated X and Y vectors.

NewX = zeros(r1,c1);% create a vector of zeros for the permutated data

% 2 for loops are created to fill the new vector with the permutated data
% and, therefore, creating two vector that can be used for the 2 fold cross
% validation. 
for i = 1:1:r1% for loop from 1 to the last value of X
   NewX(i,:) = Obs(vectorX(i),:); % the permutated data is filled in the new X vector
end

% consequently, taking in consideration the new vectors obtained by the
% permutation, the train and test vectors are created by dividing vector in
% half, so that the 2fold cross validation can be performed.
trainD = NewX(1:10000,:);% training X vector with 250 values 
testD = NewX(10001:20000,:);% testing X vector with 250 values
end


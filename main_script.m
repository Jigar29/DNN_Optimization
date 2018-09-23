%Clearing the environment 
clc; 
clear all; 

%Adding search paths to the directory 
addpath('functions', 'dataset'); 

%loading the dataset 
load mnist_data20by20.mat

disp(getSigmoidArray([1, 3, 4]))
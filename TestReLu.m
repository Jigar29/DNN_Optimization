%Clearing the environment 
clc; 

%Adding search paths to the directory 
addpath('functions', 'dataset');

x = -3.14:0.1:3.14;
input = sin(x);
plot(x, input);
%calling ReLu Function
getReLuArray(input,32)
plot(x, getReLuArray(input,32))
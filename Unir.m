%Edgar Moises Hernandez-Gonzalez
%20/07/20
%Unir subconjuntos

clear
clc

train = [];
test = [];

load('MI901T.mat')
train = [train; signals];
clear signals

load('MI902T.mat')
train = [train; signals];
clear signals

load('MI903T.mat')
train = [train; signals];
clear signals

load('MI904E.mat')
test = [test; signals];
clear signals

load('MI905E.mat')
test = [test; signals];
clear signals

save('MI_train_9.mat','train');
save('MI_test_9.mat','test');
clear
clc

load('MI_test_9.mat');
nan_canal = sum(isnan(test))
nan_total = sum(sum(isnan(test)))
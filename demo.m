% this is a demo for Content Propagation

clear;
clc;

% add all sub-folders into path
addpath(genpath(pwd));

% load the data
load('cora.mat');

% detected communities with CPIP_SI
% you can also try other three models by:
% [cy, ~] = CPIP_PI (7, f, l);
% [cy, ~] = CPRW_SI (7, f, l);
% [cy, ~] = CPRW_PI (7, f, l);

[cy, ~] = CPIP_SI (7, f, l);

F1 = F1Over(y, cy)
JC = JCOver(y, cy)
nmi_score = nmi(y, cy)
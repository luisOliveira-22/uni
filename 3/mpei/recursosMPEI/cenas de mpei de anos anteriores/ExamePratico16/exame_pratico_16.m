%% Clear
close all;
clear all;
clc;


%% Ex1

%a)

T = [0.9,0.5,0.5; 0.09,0.4,0.4; 0.01,0.1,0.1];
v = [0;0;1];

%b)
T4 = T^4;
res_a = T4*v;

%c)

prev = T*v;
count = 2;

while true
    next = (T^count)*v;
    if(max(abs(prev-next)) < 1e-3)
        res_c = next;
        break
    end
    prev = next;
    count = count+1;
end
    
%% Ex2

H = [0 0.5 1/3 0.25 0; 0.5 0 0 0.25 0.5; 0.5 0.5 1/3 0.25 0; 0 0 0 0.25 0.5; 0 0 1/3 0 0];
N = ones(5)*1/5;

A = (0.8*H)+(0.2*N);

init = ones(5,1)*1/5;

resb = (A^10)*init;


%% Ex3

T = [0.7 0.2 0 0 0 0; 0.2 0 0.3 0 0 0; 0 0.6 0.3 0 0 0; 0.1 0.2 0.3 0.1 0 0; 0 0 0.1 0.5 1 0; 0 0 0 0.4 0 1];

v=[1;0;0;0;0;0];
T10 = T^10;
T15 = T^15;

res_b1=T10*v;
res_b2=T15*v;

Q = T(1:4,1:4);
I = eye(4);
F = (I-Q)^(-1);
res_c = sum(F);




    
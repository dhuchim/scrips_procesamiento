%Calcular coeficientes ejemplo 8.2
clc
clear all
N = 3; 
OmegaC = 0.5; 
[b,a] = u_buttap(N,OmegaC);
[C,B,A] = sdir2cas(b,a)

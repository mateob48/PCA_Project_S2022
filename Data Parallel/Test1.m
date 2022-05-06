clear
clc

A = magic(5);
B = magic(5);
C = ones(5);
D = rand(5);
E = zeros(5);
F = zeros(5);

spmd(6) 
    if labindex == 1
        y = matrixmul(A,B);
    elseif labindex == 2
        y = matrixmul(C,D);
    elseif labindex == 3
        y = matrixmul(E,F);
    end
end
t = [y{1};y{2};y{3}];


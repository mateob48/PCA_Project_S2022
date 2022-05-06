function a = parf(n,A)
    a = zeros(1,n);
    parfor i = 1:n
        a(i) = max(abs(eig(rand(A))));
    end
end
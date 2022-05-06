function [Xi,Gamma] = expectation(alpha,trans,B,beta,T,N)

    Xi=zeros(T-1,N,N);
    for t=1:T-1
        for i=1:N
            for j=1:N
                Xi(t,i,j)=alpha(t,i)*trans(i,j)*B(t+1,j)*beta(t+1,j);
            end
        end
        a=Xi(t,:,:);
        Xi(t,:,:)=a./sum(a(:));
    end    
    Gamma=(sum(Xi,3));


end
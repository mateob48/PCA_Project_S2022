function [beta] = betaCalc(beta1,scale1,trans,B,N)
    T = length(beta1);
    for t=T-1:-1:1
        for i=1:N
            beta1(t,i)=sum(trans(i,:).*B(t+1,:).*beta1(t+1,:))/scale1(t);
        end
    end

    beta = beta1;

end
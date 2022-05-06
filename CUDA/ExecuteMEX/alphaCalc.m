function [alpha,scale] = alphaCalc(alpha1,scale1,trans,B,N,T)

    for t=2:T
        for i=1:N
            alpha1(t,i)=sum(alpha1(t-1,:).*trans(:,i)')*B(t,i);
        end
        scale1(t)=sum(alpha1(t,:));
        alpha1(t,:)=alpha1(t,:)./scale1(t);        
    end

    alpha = alpha1;
    scale = scale1;
end
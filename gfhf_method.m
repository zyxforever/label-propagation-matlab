function [F]=gfhf_method(X,sigma,Y_input,n_iter)


    %Similarity matrix
    dist = pdist2(X,X,'euclidean');
    dist=dist.^2;
    W=exp(-dist/sigma);
    diag_W=diag(diag(W));
    W=W-diag_W;
    D=diag(sum(W,2));
    D=D^(-1);
    S=D*W;
    
    %propagation
    F=Y_input;
    for i=1:n_iter
        F=S*F;
        row_sum=sum(F,2);
        F=F./row_sum;
    end
end

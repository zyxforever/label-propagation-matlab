function [F]=lgc_method(X,sigma,Y_input,n_iter)

    %Similarity matrix
    dist = pdist2(X,X,'euclidean');
    dist=dist.^2;
    W=exp(-dist/sigma);
%     W=GSfuc(dist,sigma);
    diag_W=diag(diag(W));
    W=W-diag_W;
    D=diag(sum(W,2));
    D=D^(-0.5);
    S=D*W*D;
    
    %propagation
    alpha=0.99;
    F=Y_input;
    for i=1:n_iter
        F=alpha*S*F+(1-alpha)*Y_input;
    end
end


function [S] = S_matrix(X,method,parameter)
%MATRIX 此处显示有关此函数的摘要
%varargin={sigma,k}
%   此处显示详细说明
    if method =='LGC'  
        S=weight_matrix(X,parameter);
    end
end

function [S]=weight_matrix(X,parameter)
    X=X./max(X);
    dist = pdist2(X,X,'euclidean');
    W=GSfuc(dist,parameter);
    diag_W=diag(diag(W));
    W=W-diag_W;
    D=diag(sum(W,2));
    D=D^(-0.5);
    S=D*W*D;

end

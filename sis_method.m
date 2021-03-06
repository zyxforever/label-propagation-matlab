function [F]=sis_method(X,k,Y_input,n_iter)


    %Similarity matrix
    [n,m]=size(X);
    dist = pdist2(X,X,'euclidean');
    dist=dist.^2;
    [d,Idx]=sort(dist,2);
    Idx(:,1)=[];
    k_idx=Idx(:,1:k);
    W=zeros(n,n);
    for i=1: n
        G=X(k_idx(k,:),:);
        b=X(i,:);
        l=l1_ls_nonneg(G',b',1);
        W(i,k_idx(i,:))=l;
%         Q_x= X(k_idx(i),:);
%         xi=X(i,:);
%         Xi=repmat(xi,k,1);
% 
%         C=(Xi-Q_x)*(Xi-Q_x)';
%         C=C+diag(ones(k,1))*(1e-3)*trace(C);
%         C_inv=pinv(C);
%         tol=sum(C_inv,'all');
%         if tol ==0
%             tol=tol+(1e-6);
%         end
%         l=sum(C_inv,2)/tol;
%         l(l<=0)=0;
%         t=sum(l);
%         if t ==0
%             tol=tol+(1e-6);
%         end
%         l=l/t;
%         W(i,k_idx(i,:))=l;
        
    end
    S=W;
    
    %propagation
    alpha=0.99;
    F=Y_input;
    for i=1:n_iter
        F=alpha*S*F+(1-alpha)*Y_input;
    end
end

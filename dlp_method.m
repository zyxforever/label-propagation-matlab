function [F]=dlp_method(X,sigma,k_num,Y_input,n_iter,labeled_idx)


    %Similarity matrix
    [n,m]=size(X);
    dist = pdist2(X,X,'euclidean');
    dist=dist.^2;
    W=exp(-dist/sigma);
    %S=W./sum(W,'all');
    S=W./sum(sum(W));
    [d,Idx]=sort(dist,2);
    Idx(:,1)=[];
    k_idx=Idx(:,1:k_num);
    P=zeros(n,m);
    for k=1: n
        P(k,k_idx(k,:))=W(k,k_idx(k,:));
    end
    
    %propagation
     alpha=0.05;
     lamda=0.1;
     [n,m]=size(S);
     I=diag(ones(n,1));
     Y=Y_input;
     p=P;
     Y=p*Y;
     P=S*(p+alpha*(Y*Y'))*S'+lamda*I;
     for k=1:n_iter
         Y=P*Y;
         Y(labeled_idx,:)=Y_input(labeled_idx,:);
         P=S*(P+alpha*Y*Y')*S'+lamda*I;
     end
%      for k=1:n_iter
%          Y=S*Y;
%          Y(labeled_idx,:)=Y_input(labeled_idx,:);
%          S=P*(S+alpha*Y*Y')*P'+lamda*I;
%      end
     F=Y;
end


function [F]=lnp_method(X,k_num,Y_input,n_iter)


    %Similarity matrix
    [n,m]=size(X);
    dist = pdist2(X,X,'euclidean');
    dist=dist.^2;
    [d,Idx]=sort(dist,2);
    Idx(:,1)=[];
    k_idx=Idx(:,1:k_num);
    for k=1: n
        G=X(k_idx(k,:),:);
        H=pdist2(G,G,'euclidean').^2;
        %f=zeros(k_num,1);
        %     A=G';
        %     b=X(k,:)';

        Aeq=ones(1,k_num);
        beq=1;
        lb=zeros(k_num,1);
        %     [x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,[],[],lb);
        options = optimoptions('quadprog','Display','none');
        %     [x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,Aeq,beq,lb);
        [x,fval,exitflag,output,lambda] = quadprog(H,[],[],[],Aeq,beq,lb);
        W(k,k_idx(k,:))=x;
    end
    S=W;
    
    %propagation
    alpha=0.99;
    F=Y_input;
    for i=1:n_iter
        F=alpha*S*F+(1-alpha)*Y_input;
    end
end


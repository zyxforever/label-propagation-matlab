function [F]=lnp_method(X,k_num,Y_input,n_iter)


    %Similarity matrix
    [n,m]=size(X);
    dist = pdist2(X,X,'euclidean');
    dist=dist.^2;
    [d,Idx]=sort(dist,2);
    Idx(:,1)=[];
    k_idx=Idx(:,1:k_num);
    W=zeros(n,n);
    for k=1: n
        G=X(k_idx(k,:),:);
        GG=G';
        xi=X(k,:)';

        for j=1:k_num
            for u=1:k_num
                H(j,u)=(xi-GG(:,j))'*(xi-GG(:,u));
          
%             H(j,u)=((xi-GG(:,j))'*(xi-GG(:,j))+(xi-GG(:,u))'*(xi-GG(:,u)))/2;
            end
        end

        Aeq=ones(1,k_num);
        beq=1;
        lb=zeros(k_num,1);
        %     [x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,[],[],lb);
        options = optimoptions('quadprog','Display','off');
%             [x,fval,exitflag,output,lambda] = quadprog(H,[],A,b,Aeq,beq,lb);
%     [x,fval,exitflag,output,lambda] = quadprog(H,[],[],[],Aeq,beq,lb);
        [x,fval,exitflag,output,lambda] = quadprog(H,[],[],[],Aeq,beq,lb,[],[],options);
        W(k,k_idx(k,:))=x;
    end
%     size(W)
    S=W;

    %propagation
    alpha=0.99;
    F=Y_input;
    for i=1:n_iter
        F=alpha*S*F+(1-alpha)*Y_input;
    end
end


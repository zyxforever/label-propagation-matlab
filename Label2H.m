function H=Label2H(IDX,k)
    CL=unique(IDX);
    n=length(IDX);
    k1=length(CL);
    H=zeros(n,k);
    for l=1:k1
        H(:,l)=(IDX==CL(l))';
    end
end
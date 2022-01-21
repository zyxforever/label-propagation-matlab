%load statlog3;
%load isolet3;
load data_MNIST10k.mat
X=data;
Y=double(labels);
X=Normalized_data(X);

% method  1'LGC',2''GFHF,
m_list=['LGC ';'GFHF';'LNP ';'DLP ';'SIS '];
method=4;
t=4;
label_rate=10;
m=60;
sigma=2*distances_means2(X)/m;
k_num=20;
[n,~]=size(X);
k=length(unique(Y));
num_per_class=fix(n*label_rate/100/k);
num_labeled=fix(num_per_class*k);

% 根据每类带标签数据的个数，提取数据 
Idx=[];
for c=min(unique(Y)):max(unique(Y))
    idx=find(Y(:,:)==c);
    idx1=idx(randperm(numel(idx),num_per_class));
    Idx=cat(1,Idx,idx1);
end

%提取相关的标签 
%input of label matrix
Y_input=zeros(n,k);
for id=1:length(Idx)
    idx_row=Idx(id);
    Y_input(idx_row,fix(Y(idx_row))+1)=1;
end

if method ==1 
    F=lgc_method(X,sigma,Y_input,t);      
elseif method ==2
    F=gfhf_method(X,sigma,Y_input,t);        
elseif method ==3
    F=lnp_method(X,k_num,Y_input,t);        
elseif method ==4
    F=dlp_method(X,sigma,k_num,Y_input,t,Idx);        
elseif method ==5
    F=sis_method(X,k,Y_input,t);
end

%propagation
% [W,Dis,delta,D1,D]=Computation_SelfSC_W(X,k,m);
% F=propagation(S,Y_input,method,t);
[score,Y_P]=max(F,[],2);
[~,acc,~,~,ari,nmi]=accuray_measures(Y_P,Y);

fprintf('method:%s,acc:%f,ari %f ,nmi:%f\n',m_list(method,:),acc,ari,nmi);




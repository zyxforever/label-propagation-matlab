%load statlog3;
%load isolet3;
load data_PenDigits.mat
X=fea;
Y=double(gt);

m=60;
t=400;
beta=0.99;
label_rate=10;
sigma=0.1;
X=Normalized_data(X);
[n,~]=size(X);
k=length(unique(Y));
num_per_class=fix(n*label_rate/100/k);
num_labeled=fix(num_per_class*k);

% 根据每类带标签数据的个数，提取数据 
Idx=[];
for c=0:k-1
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

%propagation
[W,Dis,delta]=Computation_SelfSC_W(X,k,m);
Y_P=LGC(W,Y_input,beta,t);
%F=propagation(W,Y_input,t);
%[score,Y_P]=max(F,[],2);
[~,acc,~,~,ari,nmi]=accuray_measures(Y_P,Y);

fprintf('acc:%f,ari %f ,nmi:%f\n',acc,ari,nmi);




%load statlog3;
load isolet3;
%load mnist10k;
[n,m]=size(fea);
g_t=unique(gt);
c=length(g_t);
g_t=g_t(randperm(numel(g_t),c));
label_rate=10;
method='LGC';
%each class number
num=fix(n*label_rate/100/c);
n_labeled=fix(num*c);
%labeled data
idx=extract(gt,g_t,num);
%input of label matrix
Y=zeros(n,c);
Y_input=label_matrix(Y,idx,gt(idx),c);

sigma=0.1;

%propagation matrix
X=fea;

X=X./max(X,[],'all');
dist = pdist2(X,X,'euclidean');
%dist=pdist2(X,X,'seuclidean');
W=GSfuc(dist,sigma);

diag_W=diag(diag(W));
W1=W-diag_W;
D1=diag(sum(W1,2));
D=D1^(-0.5);
S=(D*W1)*D;

%propagation
n_iter=4;
F=propagation(S,Y_input,n_iter);
[score,p_labels]=max(F,[],2);
acc=evaluate(gt,p_labels);

a=[1,2,3,4;4,5,6,7;7,8,9,10;11,12,13,14]
d_a=diag(diag(a))
D=d_a^(-0.5)
p=a-d_a
5^(-0.5)
0.1^2
sigma=0.1
f=[1,1,1,1,1,1,1,1,1,1,1]
b=[0,0,0]
h=[2,4,6]
f(h)=b
I=[]
A=[1;2;3]
cat(1,I,A)
a_=[1,1,1,1;2,2,2,2]
idx=[2,3]
a(idx,:)=a_
c=a(2,b)
d = pdist2(a,a,'seuclidean')
K=2
[D,I] = pdist2(a,a,'seuclidean','Smallest',K)
[row,col]=size(a)
len_a = length(a)
nsamples = 5;
npoints = 50;
o=10/5
for k = 1:nsamples
    currentData = rand(npoints,1);
    sampleMean(k) = mean(currentData);
end
overallMean = mean(sampleMean)
if overallMean < .49
   disp('Mean is less than expected')
elseif overallMean > .51
   disp('Mean is greater than expected')
else
   disp('Mean is within the expected range')
end
sum(a,1) %lie
sum(a,2) %hang
[f,I]=max(a,[],2)
try 
    a*b
catch
    a.*b
end
%max 38


H=[1 -1;-1 2];
f=[-2;-6];
A=[1 1;-1 2;2 1];
b=[2;2;3];
lb=[0;0];
[x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,[],[],lb)
load Statlog3
idx=find(gt(:,:)==1)
idx1=idx(randperm(numel(idx),10))
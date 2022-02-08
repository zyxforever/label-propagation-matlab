% load data_PenDigits_bai.mat;
% load data_PIE.mat;
% load data_Umist.mat;
% load data_MNIST10k.mat;
% load data_Statlog.mat;
load data_ORL_32.mat;
% load data_COIL20.mat;
% load data_Digits;
% X=data;
% X=fea;
X=double(X);
% Y=double(gt);
Y=double(y);
X=Normalized_data(X);

[n,~]=size(X);
m=360;
sigma=2*distances_means2(X)/m;
sigma2=2*distances_means2(X)/90;
sigma3=2*distances_means2(X)/1600;
k_num=15;
S1=S_matrix(X,1,sigma,k_num);
S2=S_matrix(X,2,sigma,k_num);
S3=S_matrix(X,3,sigma,8);
[S4,P]=S_matrix(X,4,sigma,9);
S5=S_matrix(X,5,sigma,2);
R=[];
for  rate=5:5:50
    label_rate=rate/100;
    for x=1:5

    m_list=['LGC ';'GFHF';'LNP ';'DLP ';'SIS '];
    times=20;
    method=x;
    t=4;
    
    k=length(unique(Y));
    result=[];
    for j=1:times
        %Y_input
        [~,Y_input]=Get_Constraints(Y,fix(label_rate*n),'PL');

        Idx=find(sum(Y_input,2));


    
    
        if method ==1 
            F=propagation(S1,[],Y_input,method,t,Idx);
        elseif method ==2
            F=propagation(S2,[],Y_input,method,t,Idx);        
        elseif method ==3
            F=propagation(S3,[],Y_input,method,t,Idx);
        elseif method ==4
            F=propagation(S4,P,Y_input,method,t,Idx);     
        elseif method ==5
            F=propagation(S5,[],Y_input,method,t,Idx);
        end

        [score,Y_P]=max(F,[],2);
        [~,acc,~,~,ari,nmi]=accuray_measures(Y_P,Y);
        result=cat(1,result,[acc,ari,nmi]);
    end
    mean_result=mean(result);
    result_std=std(result);
    one_result=cat(2,cat(2,mean_result,result_std),label_rate);
    R=cat(1,R,one_result);
    
%     fprintf('method:%s,label_rate:%3f,mean_result %f ',m_list(method,:),label_rate,mean_result);
    end
end
save result_orl32 R;

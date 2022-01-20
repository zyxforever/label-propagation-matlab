function [Y_] = label_matrix(Y,idx,gt,c)
%LABEL_MATRIX 此处显示有关此函数的摘要
%   此处显示详细说明
    temp=zeros(length(idx),c);
    for k=1:length(idx)
        temp(k,gt(k))=1;
    end
    Y(idx,:)=temp;
    Y_=Y;
end


function [Y_] = label_matrix(Y,idx,gt,c)
%LABEL_MATRIX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    temp=zeros(length(idx),c);
    for k=1:length(idx)
        temp(k,gt(k))=1;
    end
    Y(idx,:)=temp;
    Y_=Y;
end


function [acc] = evaluate(t_labels,p_labels)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    acc=length(find(t_labels==p_labels))/length(t_labels)
end


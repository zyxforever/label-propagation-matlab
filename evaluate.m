function [acc] = evaluate(t_labels,p_labels)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    acc=length(find(t_labels==p_labels))/length(t_labels)
end


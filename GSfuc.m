function [W] = GSfuc(dist,sigma)
%GSFUC 此处显示有关此函数的摘要
%   此处显示详细说明
    W=exp((-dist)/2*(sigma^2));
end


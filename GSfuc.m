function [W] = GSfuc(dist,sigma)
%GSFUC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    W=exp((-dist)/2*(sigma^2));
end


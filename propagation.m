function [F] = propagation(S,Y_input,n_iter)
%PROPAGATION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    alpha=0.99;
    F=alpha*S*Y_input+(1-alpha)*Y_input;
    for i=1:n_iter
        F=alpha*S*F+(1-alpha)*Y_input;
    end
end


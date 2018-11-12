function [res] = gramgv(X)
O{1} = X(1,:)/sqrt(sum(X(1,:).^2));
for k=2:size(X,1)
    S = X(k,:);
    for m=1:k-1
        S = S-((O{m}*X(k,:)')/(O{m}*O{m}'))*O{m};
    end
    O{k} = S/(sqrt(sum(S.^2)));
end
res = O;
end
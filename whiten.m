function [X] = whiten(X,fudgefactor)

if isempty(fudgefactor) == 1
    maxEig = max(X);
    while size(maxEig,2) > 1
        maxEig = max(maxEig);
    end
   
    fudgefactor = 1e-6*maxEig;
end

X = bsxfun(@minus, X, mean(X));
A = X'*X;
[V,D] = eig(A);
X = X*V*diag(1./(diag(D)+fudgefactor).^(1/2))*V';
end

function [newU, newSigma,newV] = compress(im, n)
    if (n>length(im))
        [u, s, v] = svd(im);
        newSigma = s;
        newU = u;
        newV = v;
    else 
        [u, s, v] = svd(im);
        newSigma = diag(s(1:n,1:n));
        newV = v(:,1:n);
        newU = u(:,1:n);
    end
end
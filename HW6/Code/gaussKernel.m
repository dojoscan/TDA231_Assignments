function f = gaussKernel(x1,x2,s)
    %x1, x2 matrices of Nxk, N points in K dimensions

    d = (x1(:,1)-x2(:,1)).^2 + (x1(:,2)-x2(:,2)).^2;
    f = exp(-d/(2*s^2));
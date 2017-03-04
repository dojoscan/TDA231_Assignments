function dists = kdist(points, classes, sigma)
    [N,k] = size(classes);
    p1 = ones(N,k);
    
    Nk = sum(classes,1);
    
    d1 = zeros(N,k);
    for in = 1:N
        for im = 1:N
            d1(in,:) = d1(in,:) + classes(im,:).*gaussKernel(points(in,:),points(im,:),sigma);
        end
    end
    d1(:,1) = 2*d1(:,1)./Nk(1);
    d1(:,2) = 2*d1(:,2)./Nk(2);
    
    
    d2 = zeros(1,k);
    for im = 1:N
        for il = 1:N
            d2 = d2 + classes(im,:).*classes(il,:)*gaussKernel(points(im,:),points(il,:),sigma);
        end
    end
    s2 = repmat(d2./Nk.^2,N,1);
    
    dists = p1-d1+s2;
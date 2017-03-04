function outVector = Level(inVector,r,mu,sigma)

noPoints = size(inVector,2);
outVector = zeros(1,noPoints);
for i = 1:noPoints
   x = inVector(:,i);
   outVector(i) = ((x-mu)'*sigma^(-1)*(x-mu)./2)-r;
end

end
function [CVE_sph,CVE_new] = kFoldCrossValError(k,X,Y,prior)

addpath('C:\Users\Donal\Desktop\TDA231 Machine Learning\HW\HW2\Problem2.1b_c')
N = size(X,1);

% Split data into class data and subset
Xpos = SplitClass(1,Y,X);
Xneg = SplitClass(-1,Y,X);
XposSets = SplitData(k,Xpos);
XnegSets = SplitData(k,Xneg);
Nset_pos = size(XposSets,1);
Nset_neg = size(XnegSets,1);
sumError_sph = 0;
sumError_new = 0;
counter = 0;

for i = 1:k
    % Fit to test set
   [mu_pos,sigma_pos] = ComputeMuSigma(XposSets(:,:,i));
   [mu_neg,sigma_neg] = ComputeMuSigma(XnegSets(:,:,i));
   % Classify each datapoint
   for j = 1:k
       if j ~= i
           for l = 1:Nset_pos
                y_sph = SphClassify(mu_pos,mu_neg,sigma_pos,sigma_neg,prior,XposSets(l,:,j));
                y_new = new_classifier(XposSets(l,:,j), mu_pos, mu_neg);
                sumError_sph = sumError_sph + abs(y_sph-1);
                sumError_new = sumError_new + abs(y_new-1);
                counter = counter+1;
           end
           for l = 1:Nset_neg
                y_sph = SphClassify(mu_pos,mu_neg,sigma_pos,sigma_neg,prior,XnegSets(l,:,j));
                y_new = new_classifier(XnegSets(l,:,j), mu_pos, mu_neg);
                sumError_sph = sumError_sph + abs(y_sph+1);
                sumError_new = sumError_new + abs(y_new+1);
                counter = counter+1;
           end
       end
   end
end

n = N*(k-1);
CVE_sph = sumError_sph/counter;
CVE_new = sumError_new/counter;

end
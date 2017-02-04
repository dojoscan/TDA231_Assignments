function y_new = classifyDigits(xNew,data)

addpath('C:\Users\Donal\Desktop\TDA231 Machine Learning\TDA231_Assignments\HW2\Problem2.1b_c')
noSample = size(data,2);
mu_5 = sum(data(:,:,5),2)./noSample;
mu_8 = sum(data(:,:,8),2)./noSample;
y_new = new_classifier(xNew', mu_5', mu_8');

end
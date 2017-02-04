function y_new = classifyDigitsNew(xNew,data)

addpath('C:\Users\Donal\Desktop\TDA231 Machine Learning\TDA231_Assignments\HW2\Problem2.1b_c')
noSamples = size(data,2);
imSize = sqrt(size(data,1));
[~, mu_5] = reformVariance(data(:,:,5),noSamples,imSize);
[~, mu_8] = reformVariance(data(:,:,8),noSamples,imSize);
xTest = reformInputData(xNew,imSize);
y_new = new_classifier(xTest, mu_5, mu_8);

end
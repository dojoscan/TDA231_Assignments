kernel = {'linear','quadratic','rbf'};
optimiser = {'SMO','QP'};
noSamples = size(X,1);
k = 5;
splitInd = crossvalind('kfold',noSamples,k);
accuracy = zeros(2,3);
time = accuracy;

for o = 1:2
    opt = optimiser{o};
    for ker = 1:3
        kern = kernel{ker};
        sum_class_acc = 0;
        tic
        for i = 1:k
            test = (splitInd == i); train = ~test;
            SVM = svmtrain(X(train,:),Y(train),'kernel_function',kern,'method',opt);
            pred = svmclassify(SVM,X(test,:));
            sum_class_acc = sum(pred==Y(test,:))/(noSamples/5) + sum_class_acc;
        end
        accuracy(o,ker) = sum_class_acc/k;
        time(o,ker) = toc;
    end
end



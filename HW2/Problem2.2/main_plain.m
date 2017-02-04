load('digits.mat')

%data = transforToVariance(data);
dataCount = 1100;
fprintf('\nRunning classifier on plain data..\n')
parts = 5;
err = 0;
mu5 = mean(data(:,:,5),2);
mu8 = mean(data(:,:,8),2);
errs = zeros(dataCount,1);
for part = 1:parts
    
    dataPoints = ones(dataCount,1);
    testStart = dataCount/parts*(part-1)+1;
    testEnd = dataCount/parts*(part);
    testData = horzcat(1:testStart-1, testEnd+1:dataCount);
    
    for i = testStart:testEnd        
        testErr = (1-new_classifier(data(:,i,5)',mu5',mu8'))/2;
        errs(i) = testErr;
        err = err + testErr/dataCount;
    end
end
fprintf('5x cross val error for 5 is: %6.4f\n',err)

err = 0;
for part = 1:parts
    
    dataPoints = ones(dataCount,1);
    testStart = dataCount/parts*(part-1)+1;
    testEnd = dataCount/parts*(part);
    testData = horzcat(1:testStart-1, testEnd+1:dataCount);
    
    for i = testStart:testEnd        
        testErr = (1-new_classifier(data(:,i,8)',mu8',mu5'))/2;
        err = err + testErr/dataCount;
    end
end
fprintf('5x cross val error for 8 is: %6.4f\n',err)


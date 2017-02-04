load('digits.mat')

dataCount = 1100;

parts = 5
err = 0;
for part = 1:parts
    
    dataPoints = ones(dataCount,1);
    testStart = dataCount/parts*(part-1)+1;
    testEnd = dataCount/parts*(part);
    testData = horzcat(1:testStart-1, testEnd+1:dataCount);
    
    for i = testStart:testEnd        
        testErr = (1 - classifyDigitsNew(data(:,i,5), data(:,testData,:)))/2;
        err = err + testErr/dataCount;
    end
end
sprintf('5x cross val error for 5 is: %6.4f\n',err)

err = 0;
for part = 1:parts
    
    dataPoints = ones(dataCount,1);
    testStart = dataCount/parts*(part-1)+1;
    testEnd = dataCount/parts*(part);
    testData = horzcat(1:testStart-1, testEnd+1:dataCount);
    
    for i = testStart:testEnd        
        testErr = (-1 - classifyDigitsNew(data(:,i,8), data(:,testData,:)))/-2;
        err = err + testErr/dataCount;
    end
end
sprintf('5x cross val error for 8 is: %6.4f\n',err)

%%
classifyDigitsNew(data(:,56,5), data)/(dataCount/parts)
(1 - classifyDigitsNew(data(:,2,5), data))/2
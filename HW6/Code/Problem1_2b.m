clear all; clc;
load('medium_100_10k.mat')
k = 10;
totalNoRuns = 10;
cavalryIdx = find(strcmp(vocab,'cavalry'));
f = zeros(1,totalNoRuns);

for i = 1:totalNoRuns
    idx1 = kmeans(wordembeddings,k, 'MaxIter', 10000000, 'Replicates', 1);
    cavalryClusterIdx = idx1(cavalryIdx);
    cavalryClusterBin = idx1==cavalryClusterIdx;
    N0 = nchoosek(nnz(cavalryClusterBin),2);
    idx2 = kmeans(wordembeddings,k, 'MaxIter', 10000000, 'Replicates', 1);
    cavalryClusters2 = idx2(cavalryClusterBin);
    binCounts = histc(cavalryClusters2,1:k);
    N1 = sum(binCounts.*(binCounts-1) / 2);
    f(i) = N1/N0;
end

fAv = mean(f)

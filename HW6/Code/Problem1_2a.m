clear all; clc;
load('medium_100_10k.mat')
k = 10;
[idx,C,~,dist] = kmeans(wordembeddings,k, 'MaxIter', 10000000);
[~,sortIdx] = sort(dist);
top10idx = sortIdx(1:10,:);
top10words = vocab(top10idx);


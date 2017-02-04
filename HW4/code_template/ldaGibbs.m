% -------------------------------------------------------------------
%
% This file is part of an exercise in the Machine Learning course of 
% Chalmers University of Technology
%
% Author: Fredrik Johansson (2013)
%
%
% ldaGibbs(data,nTopics,alpha,eta,nIt,nReadIt,
%          nBurnIn, nWords) 
% trains the LDA model based on wordcounts in data using nTopics 
% topics.
%
% data      A cell-array where each element is a sparse representation 
%           of the word count for a single document. Each cell has two
%           fields, id (representing word ids) and cnt (counts)
% nTopics   The number of topics to be used
% alpha     The parameter alpha
% eta       The parameter eta
% nIt       The number of Gibbs iterations to perform
% nReadIt   The number of iterations between parameter readouts
% nBurnIn   The number of iterations making up the burn-in
% nWords    The number of words in the vocabulary
% 
% -------------------------------------------------------------------

% --- TO DO
% PLOT RESULTS
% CHECK BETA THETA FORMULA

function [beta, theta] = ldaGibbs(data, nTopics, alpha, eta, ...
    nIt, nReadIt, nBurnIn, nWords)

% --- Variable declaration
nDocuments = length(data);
beta = zeros(nTopics,nWords);
N = beta;
theta = zeros(nDocuments,nTopics);
M = theta;

% ------- BELOW, YOU SHOULD IMPLEMENT THE GIBBS SAMPLER -------------
% ------- AND OUTPUT beta AND theta.                     -------------

% --- Initialization: initialise topics at random & update counts
z = cell(nDocuments,1);
for i = 1:nDocuments
   nBins = size(data{i}.cnt,2);
   for j = 1:nBins
       count = data{i}.cnt{j};
       wordID = data{i}.id{j};
       zD = zeros(1,count);
       for k = 1:count
           zD(k) = randi(nTopics);
           M(i,zD(k)) = M(i,zD(k))+1;
           N(zD(k),wordID) = N(zD(k),wordID)+1;
       end
       z{i}{j} = zD;
   end
end

lagCounter = 0;
p = zeros(1,nTopics);
for int = 1:nIt
    for doc = 1:nDocuments
        nBins = size(data{doc}.cnt,2);
        for bin = 1:nBins
            count = data{doc}.cnt{bin};
            wordID = data{doc}.id{bin};
            for c = 1:count
                zi = z{doc}{bin}(c);
                N(zi,wordID) = N(zi,wordID)-1;
                M(doc,zi) = M(doc,zi)-1;
                % --- Compute P(zi = top)
                for top = 1:nTopics
                    p(top) = (eta+N(top,wordID))/(nWords*eta+sum(N(top,:)))*...
                        (beta+M(doc,top))/(nTopics*beta+sum(M(doc,:)));
                end
                % --- Sample z from p
                CDF = cumsum(p);
                diff = abs(CDF-rand());
                [~,newTop] = min(diff);
                z{doc}{bin}(c) = newTop;
                % --- Update counts
                N(newTop,wordID) = N(newTop,wordID)+1;
                M(doc,newTop) = M(doc,newTop)+1;
            end
        end
    end
    % --- Update beta theta
    if nBurnIn > nIt
        lagCounter = lagCounter+1;
        if mod(nReadIt,lagCounter) == 0 
            for d = 1:nDocuments
                for k = 1:nTopics
                    theta(d,k) = (M(d,k)+alpha)/(sum(M(d,:))+alpha);
                    for w = 1:nWords
                        beta(k,w) = (N(k,w)+eta)/(sum(N(k,:))+eta);
                    end
                end
            end
        end
    end
end

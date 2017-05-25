% function to run KNN classification


function pred_label = cse408_knn(test_feat, train_label, train_feat, k, DstType)

dist = [];
%train_feat = transpose(train_feat);
if DstType == 1 %SSD
    %PUT YOUR CODE HERE
    if(length(test_feat) < 1)
        disp("the length of train_feat can't be less than 1");
        return;
    end
    for i = 1:size(train_feat,2)
        X = train_feat(:,i) - test_feat;
        dist(i) = sum(X(:).^2);
    end
elseif DstType == 2 %Angle Between Vectors
    %PUT YOUR CODE HERE 
    if(length(test_feat) < 1)
        disp("the length of train_feat can't be less than 1");
        return;
    end
    for i = 1:size(train_feat,2)
        X = train_feat(:,i);
        Y = test_feat;
        CosTheta = dot(X,Y)/(norm(X)*norm(Y));
        ThetaInDegrees = acosd(CosTheta);
        dist(i) = ThetaInDegrees;
    end
elseif DstType == 3 %Number of words in common
    %PUT YOUR CODE HERE 
    if(length(test_feat) < 1)
        disp("the length of train_feat can't be less than 1");
        return;
    end
    for i = 1:size(train_feat,2)
        X = train_feat(:,i);
        Y = test_feat;
        XY = [];
        for j = 1:length(X)
            XY(j) = X(j)*Y(j);
        end
        dist(i) = length(XY) - sum(XY(:)==0);
    end
    dist = -dist; % Why minus?
end



%Find the top k nearest neighbors, and do the voting. 

[B,I] = sort(dist);

posCt=0;
negCt=0;
for ii = 1:k
    if train_label(I(ii)) == 1
        posCt = posCt + 1;
    elseif train_label(I(ii)) == 0
        negCt = negCt + 1;
    end    
end

if posCt >= negCt
    pred_label = 1;
else
    pred_label = 0;
end
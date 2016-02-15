transAcc = readTranscounts('K:\Soccer Transcounts\Vid1Seq2\Transcounts.txt');

len = length(transAcc);
segLen = 100;
numSeg = ceil(len/segLen);
transSeg = {};
transSegC = {};

for i = 1:numSeg
    
    transSeg{i}.trans{1} = eye(3);
    transSegC{(i-1)*segLen+1} = eye(3);
    for j = 2:segLen
        
        id = (i-1)*segLen + j;
        if id > len
            continue;
        end
        
        temp = transAcc{id}*inv(transAcc{id-1});
        transSeg{i}.trans{j} = temp*transSeg{i}.trans{j-1};
        transSegC{id} = transSeg{i}.trans{j};
        
    end
    
end

function transAcc = readTranscounts(path)

% file = fopen('K:\Soccer Transcounts\Vid1Seq4\Transcounts.txt');
file = fopen(path);
FA = fscanf(file,'%f');
A = reshape(FA,9,[]);
trans = {};
transAcc = {};

for i = 1:size(A,2)
    
    temp = A(:,i);
    transAcc{i} = reshape(temp,3,3)';
    
end
% transAcc{1} = trans{1};
% for i = 2:length(trans)
%     transAcc{i} = transAcc{i-1}*trans{i};
% end

% save
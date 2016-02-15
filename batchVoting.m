votes = [];


%% loop over all frames, 

% check the deformation cost of each frame with all possible model combinations that have the
% same number of nodes as the current frame.
% The output : "votes" is 10 x number of frames. For each column we get the
% most likely model label for each track
% The structure TracksTeam1 has a set of track locations for each frame for
% each team.
TT1 = correctTracksFn(fieldModelGTTracks);
TracksTeam1 = TT1;

for i = 1:length(TracksTeam1)
    
    temp = TracksTeam1{i};
    temp = temp(1:10,:);
%     temp(temp(:,3)==0,:) = [];
    labels = netDeformationCost(temp, formation2);
    votes(:,i) = labels;
    i
    
end

%%


%% Check the mode for each track and assign a label based on an optimized
%% assignmnet using mode ratio

finalClasses = [];

votesInf = votes;
votesInf(votesInf==0)=NaN;
% for i = 1:10
%     
%     finalClasses(i) = mode(votesInf(i,:));
%     
% end

counts = [];
for i = 1:10
    
    
    for j = 1:10
        counts(i,j) = (sum(votesInf(i,:)==j))/sum(~isnan(votesInf(i,:)));
    end
end

cClasses = munkresMaxMat(counts);

%%
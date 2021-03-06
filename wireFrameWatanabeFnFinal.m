function tP = wireFrameWatanabeFnFinal(cPos1, cPos3, cCen1, cCen2, f, P)

%% params;
cCen = [cCen1 cCen2 1];
cPos = [cPos1, 410, cPos3];
% %%
warpPts = [cCen;
           cCen+[30 30 0];
           cCen+[60 30 0];
           cCen+[0 60 0];
           cCen+[-30 60 0];];

P = [P; warpPts];
theta = atan2((cPos(2) - cCen(2)),((cPos(1) - cCen(1))));
phi = atan2((cPos(3)-cCen(3)),(sqrt(sum((cPos(2)-cCen(2)).^2 + (cPos(1)-cCen(1)).^2))));

R = [-sin(theta) cos(theta) 0 ;
    
    -sin(phi)*cos(theta) -sin(phi)*sin(theta) cos(phi);
    
    cos(phi)*cos(theta) cos(phi)*sin(theta) sin(phi)];

tP = R*(repmat(cPos,size(P,1),1) - P)';

tP(1,:) = -tP(1,:)./tP(3,:);
tP(2,:) = -tP(2,:)./tP(3,:);
tP(3,:) = -tP(3,:)./tP(3,:);

tP = round(tP.*f);

% disPlayWarpedPts;
% warpedPts = tP(:,end-3:end);
% tP = tP(:,1:end-4);

% szOpT = [640 352];
% szOpTby2 = round(szOpT/2);
% 
% ind1 = find(tP(1,:) <  -szOpTby2(1) | tP(1,:) > szOpTby2(1));
% ind2 = find(tP(2,:) < -szOpTby2(2)  | tP(2,:) > szOpTby2(2));
% ind = union(ind1,ind2);
%  
% tP(:,ind) = [];
% 
% minX = -szOpTby2(1);
% maxX = szOpTby2(1);
% 
% minY = -szOpTby2(2);
% maxY = szOpTby2(2);
% 
% tP(1,:) = tP(1,:) - minX + 1;
% tP(2,:) = tP(2,:) - minY + 1;

% %%
% 
% warpedPts(1,:) = warpedPts(1,:) - minX + 1;
% warpedPts(2,:) = warpedPts(2,:) - minY + 1;
% 
% warpedPts = warpedPts';
% 
% temp = warpedPts;
% warpedPts(:,1) = temp(:,2);
% warpedPts(:,2) = temp(:,1);
% warpedPts = warpedPts(:,1:2);
% 
% 
% szOp = [641 353];
% 
% opI = zeros(szOp);
% ind = sub2ind(size(opI), tP(1,:), tP(2,:));
% opI(ind) = 255;
% opI = opI(:,end:-1:1);
% opI = opI';
% figure; imshow(opI); hold on

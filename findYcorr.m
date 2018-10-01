function yCorrespondences = findYcorr(camera, projector)

tic

camera = camera/max(max(max(camera)));
projector = projector/max(max(max(projector)));

yCorrespondences = zeros(size(camera,1),size(camera,2));
for cy = 1:size(camera,1)
    for cx = 1:size(camera,2)
    minXVal = Inf;
    minXInd = -1;      
        for px = 1:size(projector,2)
            diff = sum(abs(camera(cy,cx,:) - projector(1,px,:)));
            if diff < minXVal
                minXInd = px;
                minXVal = diff;
            end
        end
    yCorrespondences(cy,cx) = minXInd;
    end
end
      toc
     
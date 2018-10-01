function xCorrespondences = findXcorr(camera, projector)

tic

camera = camera/max(max(max(camera)));
projector = projector/max(max(max(projector)));

xCorrespondences = zeros(size(camera,1),size(camera,2));
for cy = 1:size(camera,1)
    for cx = 1:size(camera,2)
    minYVal = Inf;
    minYInd = -1;      
        for py = 1:size(projector,1)
            diff = sum(abs(camera(cy,cx,:)-projector(py,1,:)));
            if diff < minYVal
                minYInd = py;
                minYVal = diff;
            end
        end
    xCorrespondences(cy,cx) = minYInd;
    end
end
      toc
     
function out = paintOut(in, corrs)
    
    out = ones(768,1024);
    % cx, cy are coordinates of the computer
            
    for cx = 1:size(corrs,1)
        for cy = 1:size(corrs,2)
            %disp([cx cy corrs(cx,cy,1) corrs(cx,cy,2)]);
            out(cy,cx) = in(corrs(cx,cy,1), corrs(cx,cy,2));
            
        end
    end
    
end
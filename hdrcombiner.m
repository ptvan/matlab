function [score , output] = hdrcombiner(images,exposures)

x = size(images,1);
y = size(images,2);
z = size(images,3);

score = zeros(x,y,z);
slope = zeros(x,y,z);

for i = 1:x
    for j = 1:y
        for k = 1:z
            
            if images(i,j,k) > 60000
                if mean(images(:,j,k)) < 60000
                    score(i,j,k) = .00001;
                else
                    score(i,j,k) = 0;
                end
            else
                score(i,j,k) = images(i,j,k)/60500;
            end
            
        end
    end
end

[slopes,errors] = slopeCalc(images,exposures);

%
%for i = 1:x
%    for j = 1:y
%        for k = 1:z
%            
%            if images(i,j,k) > 65500
%                slope(i,j,k) = 0;
%            else
%                
%                max = max(images(i,j,:));                
%                
%                slope(i,j,k) = max/images(i,j,k);
%                
%            end           
%            
%        end
%    end
%end

total= zeros(x,y,k);
output = zeros(x,y);

for i = 1:x
    for j = 1:y
        for k = 1:z
                       
            total(i,j,k) = score(i,j,k)*((images(i,j,k)+(exposures(z)-exposures(k))*slopes(i,j))^2); 
    
        end

        output(i,j) = sqrt(sum(total(i,j,:))/sum(score(i,j,:)));
                
    end
end

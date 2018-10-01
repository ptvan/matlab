function [slopes,errors] = slopeCalc(images,exposures)

x = size(images,1);
y = size(images,2);
z = size(images,3);

slopes = zeros(x,y);
errors = zeros(x,y);

for i = 1:x
    for j = 1:y
        
        vector = zeros(1,size(images,3));
        
        for k = 1:size(images,3)
           vector(k) = images(i,j,k); 
        end        
%        disp(size(vector));
        vectorexp = exposures;
        
        for k = z:-1:1
           
            if vector(k) == 65535                                                
                vector(k) = [];   
                vectorexp(k) = [];                
            end
            
        end
        
        if size(vector,2) > 1 && std(vectorexp) ~= 0
            %disp(size(vector));
            %disp(vector);
            [p,perr] = fitline(vectorexp,vector);
        
            slopes(i,j) = p(1);
            errors(i,j) = perr(1);        
        else

                slopes(i,j) = 1; 
                errors(i,j) = 0;            

        end
            
    end
end

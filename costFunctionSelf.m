function [ J , thetaa ] = costFunctionSelf( theta,X ,y )
[m , n ] = size(X);
thetaa = zeros(size(theta) );
J = 0 ;
for i = 1 : m 
    J += (-y(i,:) * log(sigmoidSelf(X(i,:) * theta)) - (1 - y(i,:)) * log1p(-sigmoidSelf(X(i,:) * theta)));
endfor
J = J./m;
for i = 1 : n 
    for j = 1 : m 
        thetaa( i , 1 ) +=  (sigmoidSelf( X(j , : ) * theta)  - y(j , :) )* X(j , i );
    endfor
endfor
thetaa = thetaa./m ;
end

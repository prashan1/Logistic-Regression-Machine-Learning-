clc ; clear ;
data = load('ex2data1.txt');

X = data(: , [1,2] ) ; y = data(: , 3);
pos = find(y==1) ; neg = find(y==0);

plot(X(pos,1), X(pos,2) , 'k+' , 'LineWidth' ,2,'MarkerSize',7)
hold on ;
plot(X(neg,1), X(neg,2) , 'ko' , 'MarkerFaceColor' ,'y','MarkerSize',7)
hold on ;
[ sizea , sizeb ] = size(X);
initial_theta = zeros(sizeb + 1, 1);

X = [ ones( sizea , 1 ) , X ];
theta = zeros( sizeb + 1 ,1 );

[J , theta ]  = costFunctionSelf([-24; 0.2; 0.2] , X , y  );

options = optimset('GradOb' , 'on' , 'MaxIter' , 400 );

[ theta , cost ] = ...
    fminunc(@(t)(costFunctionSelf(t,X , y )) , initial_theta , options);
    
plotDecisionBoundary(theta, X, y);
% Put some labels 
\
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')
% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;
prob = sigmoidSelf([1 45 85] * theta);
hold on ;

plot(55 , 85 ,'ro')

fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n'], prob);
fprintf('Expected value: 0.775 +/- 0.002\n\n');

p = predictt(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');

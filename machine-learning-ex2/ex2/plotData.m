function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
ind_false = find(y==0);
ind_true = find(y==1);
scatter(X(ind_false,1),X(ind_false,2),'ko')
scatter(X(ind_true,1),X(ind_true,2),'k+')







% =========================================================================



hold off;

end

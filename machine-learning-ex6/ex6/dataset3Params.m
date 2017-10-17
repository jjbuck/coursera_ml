function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C_best = C
sigma_best = sigma
predictions_best = 1000000; % arbitrarily large
rng = [0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0, 30.0];
for ii=1:length(rng)
    for jj = 1:length(rng)
        C = rng(ii);
        sigma = rng(jj);
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
        predictions = svmPredict(model,Xval);
        pred_error = mean(double(predictions ~= yval));
        if pred_error < predictions_best
            C_best = C;
            sigma_best = sigma;
            predictions_best = pred_error;
        end
    end
end

C = C_best;
sigma = sigma_best;





% =========================================================================

end

% Load and prepare data
data = readtable('New_dataset.csv'); % Load data file
inputFeatures = data{:, {'Temp_min', 'Temp_max', 'Rain', 'Maxwindgust_spd'}};
target = data.solarexposure;

% Normalize data
[inputNorm, inputPS] = mapminmax(inputFeatures', 0, 1);
[targetNorm, targetPS] = mapminmax(target', 0, 1);

% Split data into training, validation, and testing sets
trainRatio = 0.7;
valRatio = 0.15;
testRatio = 0.15;
[trainInd, valInd, testInd] = divideblock(size(inputNorm, 2), trainRatio, valRatio, testRatio);

% Create and train the ANN using newrb
goal = 0.01; % Performance goal
spread = 1; % Spread of the radial basis functions
net = newrb(inputNorm(:, trainInd), targetNorm(:, trainInd), goal, spread);

% Evaluate the model
outputs = net(inputNorm);
errors = gsubtract(targetNorm, outputs);
performance = perform(net, targetNorm, outputs);

% Generate plots
figure, plotregression(targetNorm, outputs);

% Denormalize predictions for interpretation
predictedSolarRadiation = mapminmax('reverse', outputs, targetPS);

% Display results
disp('Training, Validation, and Testing Performance:');
disp(['Training: ', num2str(performance)]);
disp(['Validation: ', num2str(performance)]);
disp(['Testing: ', num2str(performance)]);

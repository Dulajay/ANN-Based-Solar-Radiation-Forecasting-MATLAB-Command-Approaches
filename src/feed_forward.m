% Load data
data = readtable('New_dataset.csv'); % Load data file
inputFeatures = data{:, {'Temp_min', 'Temp_max', 'Rain', 'Maxwindgust_spd'}}; % Extract input features
target = data.solarexposure; % Extract target variable (solar radiation)

% Normalize data
[inputNorm, inputPS] = mapminmax(inputFeatures', 0, 1); % Normalize input features
[targetNorm, targetPS] = mapminmax(target', 0, 1); % Normalize target variable

% Split data into training, validation, and testing sets
trainRatio = 0.7; % Training set ratio
valRatio = 0.15; % Validation set ratio
testRatio = 0.15; % Testing set ratio
[trainInd, valInd, testInd] = divideblock(size(inputNorm, 2), trainRatio, valRatio, testRatio); % Divide data

% Create and train the ANN using newff and traingd
hiddenLayerSize = 10; % Number of neurons in the hidden layer
net = newff(inputNorm, targetNorm, hiddenLayerSize); % Create neural network
net.trainFcn = 'traingd'; % Set training function to gradient descent backpropagation

% Set divide functions for data division
net.divideFcn = 'divideblock'; % Set data division function
net.divideParam.trainRatio = trainRatio; % Set training set ratio
net.divideParam.valRatio = valRatio; % Set validation set ratio
net.divideParam.testRatio = testRatio; % Set testing set ratio

% Train the network
net = train(net, inputNorm, targetNorm); % Train the neural network

% Evaluate the model
outputs = net(inputNorm); % Predict outputs using trained network
errors = gsubtract(targetNorm, outputs); % Calculate errors
performance = perform(net, targetNorm, outputs); % Evaluate performance

% Denormalize predictions for interpretation
predictedSolarRadiation = mapminmax('reverse', outputs, targetPS); % Denormalize predictions

% Display results
disp('Training, Validation, and Testing Performance:');
disp(['Training: ', num2str(performance)]);
disp(['Validation: ', num2str(performance)]);
disp(['Testing: ', num2str(performance)]);

% Plot results
figure; % Create a new figure window
plot(1:numel(target), target, 'b', 1:numel(predictedSolarRadiation), predictedSolarRadiation, 'r'); % Plot actual vs predicted
xlabel('Sample'); % Label x-axis
ylabel('Solar Radiation Level'); % Label y-axis
title('Actual vs. Predicted Solar Radiation'); % Add title
legend('Actual', 'Predicted'); % Add legend
grid on; % Add grid

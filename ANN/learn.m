
% Feedforward Neural Network with Backpropagation
% Author : Sreenatha Bhatlapenumarthi


% Initialization
epsolon = 0.1;
theta1 = rand(5,13) * epsolon;
theta2 = rand(27,5) * 100 * epsolon;
delta3 = zeros(1,5);
delta3 = zeros(1,27); 
Delta1 = zeros(5,13);
Delta2 = zeros(27,5);

% Extract training data
train_input = [];
train_output = [];
train_dir = dir('./train_data');
classes = length(train_dir)-2;
for class_it=3:length(train_dir)
    class = train_dir(class_it).name;
    class_dir = dir(fullfile('./train_data', class));
    for sample_it=3:length(class_dir)
        [sample freq] = wavread(fullfile('./train_data',class,class_dir(sample_it).name));
        sample_mfcc = mfcc(sample, freq, 0.25);
        sample_mfcc = sample_mfcc(:,2:size(sample_mfcc,2));
        sample_mfcc = sum(sample_mfcc,2);
        %class
        %class_dir(sample_it).name
        if sample_mfcc(1,1) ~= -Inf && sample_mfcc(1,1) ~= NaN && sample_mfcc(1,1) ~= Inf
            train_input = [train_input; sample_mfcc'];
            output = zeros(1,classes);
            output(str2num(class)) = 1;
            train_output = [train_output; output];
        end;       
    end;
end;

display('Extracted training data');

% Apply learning algorithm
for i=1:size(train_input,1)
    train_input(i,:) * theta1'
    %a2 = sigmoid(train_input(i,:) * theta1');
    a2 = gaussian(train_input(i,:) * theta1');
    a2
    output = sigmoid(a2 * theta2');
    output
    output = floor(regression_output / max(regression_output));  
    output
    %train_output(i,:)
    delta3 = output - train_output(i,:);    
    delta2 = (delta3 * theta2) .* (a2 .* (1 - a2));
    Delta1 = Delta1 + (delta2' * train_input(i,:));
    Delta2 = Delta2 + (delta3' * a2);
end;

% Update neural network edge-weights
theta1 = theta1 + Delta1;
theta2 = theta2 + Delta2;

display('Finished learning');

% Extract testing data
test_input = [];
test_output = [];
test_dir = dir('./test_data');
classes = length(test_dir)-2;
for class_it=3:length(test_dir)
    class = test_dir(class_it).name;
    class_dir = dir(fullfile('./test_data', class));
    for sample_it=3:length(class_dir)
        [sample freq] = wavread(fullfile('./test_data',class,class_dir(sample_it).name));
        sample_mfcc = mfcc(sample, freq, 4);               
        sample_mfcc = sum(sample_mfcc,2);
        if sample_mfcc(1,1) ~= -Inf && sample_mfcc(1,1) ~= NaN && sample_mfcc(1,1) ~= Inf
                test_input = [test_input; sample_mfcc'];
                output = zeros(1,classes);
                output(str2num(class)) = 1;
                test_output = [test_output; output];
        end;
    end;
end;

display('Extracted test data');

%Run ANN on test samples
error = 0;
for i=1:size(test_output,1)
    a2 = sigmoid(test_input(i,:) * theta1');
    regression_output = a2 * theta2';
    output = floor(regression_output / max(regression_output));     
    error = error + max(abs(output - test_output(i,:)));    
end;
%accuracy = positive_hits/size(test_input,1) * 100;
error

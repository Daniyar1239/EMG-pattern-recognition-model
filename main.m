%% Load and concatenate data
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone'
load_data
%% Split data into training and holdout (test) sets
split = cvpartition(s1_labels, 'HoldOut', 0.1);
testIdx = split.test;
trainIdx = split.training;
X_train = s1_data(trainIdx,:);
y_train = s1_labels(trainIdx,:);
X_test = s1_data(testIdx,:);
y_test = s1_labels(testIdx,:);
%% Power spectrum density (PSD) using pwelch method
Fs = 2000;
pxx = powerfunc(s1_data, Fs);
%% Bandpass filter design
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone\filter design'
% nth order Butterworth filter design
% Hd_butter = buttfilt(8); % Function's argument is the Filter's order
% nth oder Elliptic Bandpass filter
% Hd_elliptic = ellipfilt(8);
% nth order Chebyshev Type I Bandpass filter
Hd_chebyshev = chebfilt(8);
%% Notch filter design
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone\filter design'
% nth order Butterworth notch filter design
Hd_notch = notch(4);
%% Filtering 
% Training set
Fs = 2000;
X_train = filt(X_train, Hd_chebyshev.sosMatrix, Hd_chebyshev.ScaleValues, Hd_notch.sosMatrix, Hd_notch.ScaleValues);
% pxx_filt_train = powerfunc(X_train, Fs);

% Testing set
X_test = filt(X_test, Hd_chebyshev.sosMatrix, Hd_chebyshev.ScaleValues, Hd_notch.sosMatrix, Hd_notch.ScaleValues);
% pxx_filt_test = powerfunc(X_test, Fs);
%% Feature extraction
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone\feature functions'
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone\feature functions\Time-Domain features'
winsize = 256;
wininc_train = 128;
wininc_test = 32;
X_train = par_feat_extract(y_train, X_train, winsize, wininc_train);  % extracting a time-domain training feature vector
X_test = par_feat_extract(y_test, X_test, winsize, wininc_test); % extracting a time-domain testing feature vector
% save('TD training feature vector.mat', 'X_train');
% save('TD testing feature vector.mat', 'X_test');
%% Class label extraction for matching feature vector dimensions
[index_train,label_train] = get_labels(y_train);
y_train = get_class(s1_data(trainIdx,:), label_train, index_train, winsize, wininc_train);
[index_test,label_test] = get_labels(y_test);
y_test = get_class(s1_data(testIdx,:), label_test, index_test, winsize, wininc_test);
%% Scaling feature vectors without Feature Selection
X_train_noFS_scaled = (X_train - min(X_train))./(max(X_train)-min(X_train));
X_test_noFS_scaled = (X_test - min(X_train))./(max(X_train)-min(X_train));
% Removing transitions
% [X_train_noFS_scaled, y_train] = remove_transitions(X_train_noFS_scaled, y_train, 8, 8);
% [X_test_noFS_scaled, y_test] = remove_transitions(X_test_noFS_scaled, y_test, 8, 8);
%% Lambda tuning in Neighborhood Component Analysis (NCA) Feature Selection
lossvals = NCA(X_train, y_train);
%% Plotting results
n = length(y_train);
lambdavals = linspace(0,20,20)/n;
meanloss = mean(lossvals,2);
figure();
plot(lambdavals, meanloss, 'ro-');
xlabel('Lambda'); ylabel('Loss (Classification error)');
grid on
%% Feature selection
[~,idx] = min(meanloss); % Find the index
bestlambda = lambdavals(idx); % Outputing the best lambda
bestloss = meanloss(idx);
%% Splitting signals by channels (1-12)
% 1st channel
X_train_1channel = one_channel(X_train,1);
X_test_1channel = one_channel(X_test,1);
% 2nd channel
X_train_2channel = one_channel(X_train,2);
X_test_2channel = one_channel(X_test,2);
% 3rd channel 
X_train_3channel = one_channel(X_train,3);
X_test_3channel = one_channel(X_test,3);
% 4th channel
X_train_4channel = one_channel(X_train,4);
X_test_4channel = one_channel(X_test,4);
% 5th channel
X_train_5channel = one_channel(X_train,5);
X_test_5channel = one_channel(X_test,5);
% 6th channel
X_train_6channel = one_channel(X_train,6);
X_test_6channel = one_channel(X_test,6);
% 7th channel
X_train_7channel = one_channel(X_train,7);
X_test_7channel = one_channel(X_test,7);
% 8th channel
X_train_8channel = one_channel(X_train,8);
X_test_8channel = one_channel(X_test,8);
% 9th channel
X_train_9channel = one_channel(X_train,9);
X_test_9channel = one_channel(X_test,9);
% 10th channel
X_train_10channel = one_channel(X_train,10);
X_test_10channel = one_channel(X_test,10);
% 11th channel
X_train_11channel = one_channel(X_train,11);
X_test_11channel = one_channel(X_test,11);
% 12th channel
X_train_12channel = one_channel(X_train,12);
X_test_12channel = one_channel(X_test,12);
%% NCA Feature selection on each individual channel
% 1st channel
nca_1 = fscnca(X_train_1channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 2nd channel
nca_2 = fscnca(X_train_2channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 3rd channel
nca_3 = fscnca(X_train_3channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 4th channel
nca_4 = fscnca(X_train_4channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 5th channel
nca_5 = fscnca(X_train_5channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 6th channel
nca_6 = fscnca(X_train_6channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 7th channel
nca_7 = fscnca(X_train_7channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 8th channel
nca_8 = fscnca(X_train_8channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 9th channel
nca_9 = fscnca(X_train_9channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 10th channel
nca_10 = fscnca(X_train_10channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 11th channel
nca_11 = fscnca(X_train_11channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
% 12th channel
nca_12 = fscnca(X_train_12channel, y_train, 'FitMethod', 'exact', 'Solver', 'sgd',...
'Lambda', bestlambda, 'Standardize', true, 'LengthScale', 1);
%% Averaging Feature Weights through all channels
FW_1 = nca_1.FeatureWeights;
FW_2 = nca_2.FeatureWeights;
FW_3 = nca_3.FeatureWeights;
FW_4 = nca_4.FeatureWeights;
FW_5 = nca_5.FeatureWeights;
FW_6 = nca_6.FeatureWeights;
FW_7 = nca_7.FeatureWeights;
FW_8 = nca_8.FeatureWeights;
FW_9 = nca_9.FeatureWeights;
FW_10 = nca_10.FeatureWeights;
FW_11 = nca_11.FeatureWeights;
FW_12 = nca_12.FeatureWeights;
FW_avg = (FW_1+FW_2+FW_3+FW_4+FW_5+FW_6+FW_7+FW_8+FW_9+FW_10+FW_11+FW_12)/12;
FW_avg_hist = max(FW_avg(41:44,1));
FW_avg_ar4 = max(FW_avg(45:48,1));
FW_avg_ar5 = max(FW_avg(49:53,1));
FW_avg_ar6 = max(FW_avg(54:59,1));
FW = [FW_avg(1:40); FW_avg_hist; FW_avg_ar4; FW_avg_ar5; FW_avg_ar6];
%% Plotting Feature Weights and applying a threshold
stem(FW, 'ro-');
xlabel('Feature index'); ylabel('Feature Weight');
grid on
%%
th = 0.65;
selidx = find(FW > th);
feature_names = {'RMS','MAV','AAC','AE','ASM','ABSS','CARD','COV','DAMV','DASDV'...
    'DVARV','EMAV','EWL','IEMG','IQR','KURT','LCOV','LD','LDAMV','LDASDV',...
    'MFL','MAD','MAVS','MSR','MMAV1','MMAV2','MYOP','NZC','SSI','SK','SSC','STD'...
    'TKEO','TEMPM','VAR','VAREMG','VO','WL','WAMP','ZC','HIST','AR4', 'AR5', 'AR6'};
FW_selected = FW(selidx, 1)';
FW_selected_table = array2table(FW', 'VariableNames',feature_names);
FW_selected_table = FW_selected_table(:, selidx);
%% Changing the training and testing feature vectors based on the selected features
selidx(19:21) = [42 43 44]; % the HIST feature has 4 columns 
X_train_FS_1 = X_train_1channel(:, selidx);
X_test_FS_1 = X_test_1channel(:, selidx);
X_train_FS_2 = X_train_2channel(:, selidx);
X_test_FS_2 = X_test_2channel(:, selidx);
X_train_FS_3 = X_train_3channel(:, selidx);
X_test_FS_3 = X_test_3channel(:, selidx);
X_train_FS_4 = X_train_4channel(:, selidx);
X_test_FS_4 = X_test_4channel(:, selidx);
X_train_FS_5 = X_train_5channel(:, selidx);
X_test_FS_5 = X_test_5channel(:, selidx);
X_train_FS_6 = X_train_6channel(:, selidx);
X_test_FS_6 = X_test_6channel(:, selidx);
X_train_FS_7 = X_train_7channel(:, selidx);
X_test_FS_7 = X_test_7channel(:, selidx);
X_train_FS_8 = X_train_8channel(:, selidx);
X_test_FS_8 = X_test_8channel(:, selidx);
X_train_FS_9 = X_train_9channel(:, selidx);
X_test_FS_9 = X_test_9channel(:, selidx);
X_train_FS_10 = X_train_10channel(:, selidx);
X_test_FS_10 = X_test_10channel(:, selidx);
X_train_FS_11 = X_train_11channel(:, selidx);
X_test_FS_11 = X_test_11channel(:, selidx);
X_train_FS_12 = X_train_12channel(:, selidx);
X_test_FS_12 = X_test_12channel(:, selidx);
%%
% Training and test feature vector
X_train_FS = [X_train_FS_1 X_train_FS_2 X_train_FS_3 X_train_FS_4 X_train_FS_5 X_train_FS_6 ...
    X_train_FS_7 X_train_FS_8 X_train_FS_9 X_train_FS_10 X_train_FS_11 X_train_FS_12];
X_test_FS  = [X_test_FS_1 X_test_FS_2 X_test_FS_3 X_test_FS_4 X_test_FS_5 X_test_FS_6 ...
    X_test_FS_7 X_test_FS_8 X_test_FS_9 X_test_FS_10 X_test_FS_11 X_test_FS_12];
%% Min-max feature scaling
X_train_scaled = (X_train_FS - min(X_train_FS))./(max(X_train_FS)-min(X_train_FS));
X_test_scaled = (X_test_FS - min(X_train_FS))./(max(X_train_FS)-min(X_train_FS));
%% Removing transitions
[X_train_scaled, y_train] = remove_transitions(X_train_scaled, y_train, 4, 4);
[X_test_scaled, y_test] = remove_transitions(X_test_scaled, y_test, 4, 4);
%%
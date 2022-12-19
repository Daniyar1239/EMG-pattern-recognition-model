% Subject 1, Exercise 1
s1_e1_data = load("DB2_s1\S1_E1_A1.mat","emg");
s1_e1_labels = load("DB2_s1\S1_E1_A1.mat","restimulus");
s1_e1_data = s1_e1_data.emg;    % Extract emg data
s1_e1_labels = s1_e1_labels.restimulus; % Extract lables
s1_e1_data = s1_e1_data(find(s1_e1_labels==1,1):end,:);
s1_e1_labels = s1_e1_labels(find(s1_e1_labels==1,1):end,:);


% Subject 1, Exercise 2
s1_e2_data = load("DB2_s1\S1_E2_A1.mat","emg");
s1_e2_labels = load("DB2_s1\S1_E2_A1.mat","restimulus");
s1_e2_data = s1_e2_data.emg;    % Extract emg data
s1_e2_labels = s1_e2_labels.restimulus; % Extract lables
s1_e2_data = s1_e2_data(find(s1_e2_labels==18,1):find(s1_e2_labels==40,1,'last'),:);
s1_e2_labels = s1_e2_labels(find(s1_e2_labels==18,1):find(s1_e2_labels==40,1,'last'),:);

% Concatenate data for subject 1
s1_data = [s1_e1_data; s1_e2_data];
s1_labels = [s1_e1_labels; s1_e2_labels];
clear s1_e1_data s1_e2_data s1_e1_labels s1_e2_labels


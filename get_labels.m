function [index,labels] = get_labels(y)

n = zeros(107,1);
% n = zeros(479,1);
n(1) = 1;
m = table2array(readtable("labels.xlsx"));
m = m(1:106);
for i = 2:107
    n(i) = find(y == m(i-1), 1) + n(i-1) - 1;
    y = y(n(i)-n(i-1)+1:end);
end
index = n;
m = [1; m];
labels = m;
end
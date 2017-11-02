clf
clc

% Define learning rate step
learning_rate = 0.01;

% Define max interation
max_interation = 10000;

printf("1 - Iris Setosa\n");
printf("2 - Iris Versicolor\n");
printf("3 - Iris Virginica\n\n");
class = input("Select Iris type to classify: ");

switch (class)
    case 1
    case 2
    case 3
    otherwise
         class = 1;
         printf("Using Iris Setosa as default\n");
endswitch

file_train = "data_train.csv";
file_test = "data_test.csv";

% Initialize parameters a (4 features + 1 for x0 which is always 1)
a = zeros(1, 5);

% Read training dataset
data_train = dlmread(file_train, ',', 0, 0);

% Set current class as 1 and all other classes as 0 (For training and classification we have only 0 or 1)
for i = 1:size(data_train)(1)
    if data_train(i, 5) != class
       data_train(i, 5) = 0;
    else
       data_train(i, 5) = 1;
    end
end

% Loop for training
for i = 1:max_interation
    a = step_gradient(a, data_train, learning_rate);
end

% Test logistic regression

% Read dataset
data_test = dlmread(file_test, ',', 0, 0);

% Set current class as 1 and all other classes as 0 (For training and classification we have only 0 or 1)
for i = 1:size(data_test)(1)
    if data_test(i, 5) != class
       data_test(i, 5) = 0;
    else
       data_test(i, 5) = 1;
    end
end

% test new data and round results to 0 or 1
results = int8(test_regression(a, data_test));

true_pos = 0;
true_neg = 0;
false_pos = 0;
false_neg = 0;


for i = 1:size(data_test)(1)
    if results(i) == data_test(i, 5)
       if results(i) == 0
          true_neg = true_neg + 1;
       else
          true_pos = true_pos + 1;
       end
    else
       if results(i) == 0
          false_neg = false_neg + 1;
       else
          false_pos = false_pos + 1;
       end
    end
end

a

true_pos
true_neg
false_pos
false_neg

accuracy = (true_pos + true_neg)*100 / size(data_test)(1);
printf("Accuracy: %1.2f\n\n", accuracy);



% Read all dataset
data = dlmread('data.csv', ',', 0, 0);

% Plot data
% x0 = 1
% x1 - Sepal lenght
% x2 - Sepal width
% x3 - Petal length
% x4 - Petal width

figure(1);
subplot(2, 3, 1, "align");
scatter(data(1:50,1), data(1:50,2), "b", "s", "filled");
hold;
scatter(data(51:150,1), data(51:150,2), "r", "filled");
hold;
title("Sepal length vs width");
xlabel("Sepal length");
ylabel("Sepal width");
box on;
hold;

subplot(2, 3, 2, "align");
scatter(data(1:50,1), data(1:50,3), "b", "s", "filled");
hold;
scatter(data(51:150,1), data(51:150,3), "r", "filled");
hold;
title("Sepal length vs Petal length");
xlabel("Sepal length");
ylabel("Petal length");
box on;
hold;

subplot(2, 3, 3, "align");
scatter(data(1:50,1), data(1:50,4), "b", "s", "filled");
hold;
scatter(data(51:150,1), data(51:150,4), "r", "filled");
hold;
title("Petal length vs Petal width");
xlabel("Sepal length");
ylabel("Petal width");
box on;
hold;

subplot(2, 3, 4, "align");
scatter(data(1:50,2), data(1:50,3), "b", "s", "filled");
hold;
scatter(data(51:150,2), data(51:150,3), "r", "filled");
hold;
title("Sepal width vs Petal length");
xlabel("Sepal width");
ylabel("Petal length");
box on;
hold;

subplot(2, 3, 5, "align");
scatter(data(1:50,2), data(1:50,4), "b", "s", "filled");
hold;
scatter(data(51:150,2), data(51:150,4), "r", "filled");
hold;
title("Sepal width vs Petal width");
xlabel("Sepal width");
ylabel("Petal width");
box on;
hold;

subplot(2, 3, 6, "align");
scatter(data(1:50,3), data(1:50,4), "b", "s", "filled");
hold;
scatter(data(51:150,3), data(51:150,4), "r", "filled");
hold;
title("Petal length vs Petal width");
xlabel("Petal length");
ylabel("Petal width");
box on;
hold;
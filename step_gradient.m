function [new_a] = step_gradient(a, data, learning_rate)
    % Get data length
    data_len = size(data)(1);
    
    
    % Get x and y points from data
    x = ones(data_len, 5); %x0 = 1
    x(:,2) = data(:, 1); %  x1 - Sepal lenght
    x(:,3) = data(:, 2); %  x2 - Sepal width
    x(:,4) = data(:, 3); %  x3 - Petal length
    x(:,5) = data(:, 4); %  x4 - Petal width
    
    y = data(:, 5);      % Iris classes
    
    % gradiente is defined as:
    % (1/n) * sum(i=0:n){x_m*[h - y]}  where x0 is ALWAYS 1  
    
    % h(x) = 1 / 1 + e^-z (logistic function)
    z = x * a';            % y = a0x0 + a1x1 + a2x2 + ... a4x4
    h = 1 ./ (1 + e.^-z);
    
    % calculate h - y which will be used in the gradient descent
    y_error = (h - y);
    
    temp = y_error' * x;        % sum(i=0:n){x_m*[y' - y]} where x_m can be x0, x1, x2, ... , x4
    a_temp = (temp)/data_len;
    new_a = a - (learning_rate * a_temp);
    
    %{
    x = [150 x 5]   - 150 samples
    a = [1 x 5]     - 5 parameters
    z = [150 x 1]   - 150 results
    h = [150 x 1]   - 150 results 
    new_a = [1 x 5] - 5 new parameters
    %}
endfunction

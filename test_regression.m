function results = test_regression (a, data)
    
    % Sigmoid function     
    % h(x) = 1 / (1 + e^-z)
    % where z = a0x0 + a1x1 + ... + a4x4  ==> where x0 is always 1

    data_len = size(data)(1);
    
    x = ones(data_len, 3);
    x(:,2:5) = data(:,1:4);
    
    y = data(:, 5);
    
    % create vector and calculate all points
    z = x * a';            % y = a0x0 + a1x1 + a2x2 
    h = 1 ./ (1 + e.^-z);

    % Returns the probability to be in class 1 or 0
    results = h;
    
endfunction
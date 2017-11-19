function data_filtered = convolution_local(data, local_window)
    Nx = size(data,2); % liczba przeksztalconych blokow
    data_filtered = zeros(1, Nx); %optymalizacja
    h = fspecial('gaussian', local_window, 25); %wspolczynnik
    for i=1:Nx
        patch = reshape(data(:, i), local_window); % szkielet
        data_filtered(i) = sum(sum(patch .* h)); % szkielet
    end
end
function data_filtered = bilateral_local(data, local_window)
    Nx = size(data,2); % liczba przeksztalconych blokow
    Ncy = ceil(local_window(1)/2); % z konspektu
    Ncx = ceil(local_window(2)/2); % z konspektu
    ro = 2.7; 
    h = fspecial('gaussian', local_window, 25); %wspolczynnik
    data_filtered = zeros(1, Nx); %optymalizacja
    for i = 1:Nx
        patch = reshape(data(:, i), local_window); % szkielet
        [rows, cols] = find(patch == patch); % z konspektu 
        rows = reshape(rows, local_window); % z konspektu 
        cols = reshape(cols, local_window); % z konspektu
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2); % z konspektu
        y = abs(patch - patch(Ncy,Ncx)); 
        gamma = exp(((-1)*(y .* y))/(2*ro*ro)); % wzor z konspektu
        data_filtered(i) = sum(sum(dist .* h .* gamma .* patch))/sum(sum(dist .* gamma)); %szkielet + normalizacja z gamma i dist
    end
end


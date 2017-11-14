function data_filtered = convolution_local(data, local_window)
    for i=1:Nx
        patch = reshape(data(:, i), local_window);
        data_filtered(i) = sum(sum(patch .* h)
    end
end
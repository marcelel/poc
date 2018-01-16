function [ shifted, amplitude, phase ] = transfomacja_fourier( im )
    shifted = fftshift(fft2(im));
    amplitude = log10(abs(shifted)+1);
    phase = angle(shifted.*(amplitude>0.0001));
    
    figure;
    subplot(1,3,1);
    imshow(shifted); title('Transformata');
    subplot(1,3,2);
    imshow(amplitude,[]); title('Amplituda');
    subplot(1,3,3);
    imshow(phase,[]); title('Faza');

end


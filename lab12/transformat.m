function [ shifted, amplitude, phase ] = transformat( im )
    fTrans = fft2(im);
    shifted = fftshift(fTrans);
    amplitude = abs(shifted);
    amplitude = log10(amplitude+1);
    phase = angle(shifted.*(amplitude>0.0001));
    
    subplot(1,3,1);
    imshow(shifted); title('Transformata');
    subplot(1,3,2);
    imshow(amplitude,[]); title('Amplituda');
    subplot(1,3,3);
    imshow(phase,[]); title('Faza');


end


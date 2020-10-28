%Edgar Moises Hernandez-Gonzalez
%20/07/20
%Reemplazar NaN por los valores obtenidos con el filtro mediana
%Input Shape: (n_muestra*1000)x3
%Output Shape: (n_muestra*1000)x3

clear
clc

load('MI_test_9.mat');
signals_limpias = zeros(size(test));
contador = 1;
n_muestras_nan = 0;
n_muestras = length(test)/1000;
for i=1:n_muestras
    muestra = test(contador:contador+999,:);
    % si hay un NaN
    if sum(sum(isnan(muestra))) > 0
        % filtro mediana
        y = medfilt1(muestra,255,'omitnan');
%         figure;
%         plot(muestra);
%         grid;
        % reemplazar NaN por los valores del filtro mediana
        muestra(isnan(muestra)) = y(isnan(muestra));
%         figure;
%         plot(muestra);
%         grid;
        signals_limpias(contador:contador+999, :) = muestra;
        n_muestras_nan = n_muestras_nan + 1;
        disp('Muestra numero');
        disp(i);
    else
        signals_limpias(contador:contador+999, :) = test(contador:contador+999, :);
    end
    contador = contador + 1000;
end
disp('Numero de muestras NaN');
disp(n_muestras_nan);

save('Limpios_test_9.mat','signals_limpias');
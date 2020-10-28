%Edgar Moises Hernandez-Gonzalez
%21/07/20
%Acomodar los datos para que queden concatenados los canales
%Input Shape: (n_muestras*1000)x3
%Output Shape: n_muestras*3000

clear
clc

load('FiltradasB9E.mat');
n_muestras = length(signals_filtradas) / 1000;
nuevo = zeros(n_muestras, 3000);
contador2 = 1;
for i=1:n_muestras
    contador1 = 1;
    for j=1:3
        nuevo(i, contador1:contador1+999)...
            = signals_filtradas(contador2:contador2+999, j);
        contador1 = contador1 + 1000;
    end
    contador2 = contador2 + 1000;
end

csvwrite('MI-EEG-B9E.csv',nuevo);
%save('MI-EEG-B1T.mat','nuevo');
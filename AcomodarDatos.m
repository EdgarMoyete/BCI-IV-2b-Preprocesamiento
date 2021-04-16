%Edgar Moises Hernandez-Gonzalez
%21/07/20-28/01/21
%Acomodar los datos para que queden concatenados los canales
%Input Shape: (n_muestras*500)x4
%Output Shape: n_muestras*2000

clear
clc

load('MuBeta_B9E.mat');
n_muestras = length(ondas_mi) / 500;
nuevo = zeros(n_muestras, 2000);
contador2 = 1;
for i=1:n_muestras
    contador1 = 1;
    for j=1:4
        nuevo(i, contador1:contador1+499)...
            = ondas_mi(contador2:contador2+499, j);
        contador1 = contador1 + 500;
    end
    contador2 = contador2 + 500;
end

csvwrite('MuBeta-EEG-B9E.csv',nuevo);
%save('MI-EEG-B1T.mat','nuevo');
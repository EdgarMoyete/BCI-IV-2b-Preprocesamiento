%Edgar Moises Hernandez-Gonzalez
%20/07/20
%Subconjuntos de datos para BCI-IV-2b
%Obtenemos los 4seg de MI del segundo 3 al 7
%Fs=250Hz, por lo tanto en 4seg son 1000 datos
%Input Shape: todox6
%Output Shape: (n_muestra*1000)x3

clear
clc

[s, h] = sload('B0905E.gdf');
n_muestras = length(h.TRIG);
signals = zeros(n_muestras*1000, 3);
contador = 1;
for i=1:n_muestras %n muestras
    %s(3seg : 7seg, numCanal)
	signals(contador:contador+999, 1:3) = s(h.TRIG(i)+751 : h.TRIG(i)+1750, 1:3);
	contador = contador + 1000;
end
save('MI905E.mat','signals');
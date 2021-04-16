%Edgar Moises Hernandez-Gonzalez
%28/01/21
%Obtener 2 segundos de C3 y C4
%BCI IV-2b (fs=250Hz): canales: 1 y 3, segundo: 0.5s a 2.5s
%BCI II-III (fs=128Hz): canales: 1 y 3, segundo: 3.5s a 5.5s

clear
clc

load('CarB09E.mat');

c3_c4 = [car(:,1) car(:,3)]; % C3 y C4, canal 1 y canal 3
n_ejemplos = length(c3_c4)/1000;
c3_c4_seg = zeros(n_ejemplos*500, 2); % matriz para guardas 2 seg de c3 y c4
contador = 1;
contador_nuevo = 1;
for i=1:n_ejemplos
    c3_c4_seg(contador_nuevo:contador_nuevo+499,:) =...
        c3_c4(contador+125:contador+624, :);
    contador_nuevo = contador_nuevo + 500; % 500 por que son 2 segundos a 250 Hz
    contador = contador + 1000; % 1000 por que son 4 segundos a 250 Hz
end

%calcular mu y beta con pasa banda
fs = 250;
mu = bandpass(c3_c4_seg, [8 13], fs); % mu 8-13Hz
beta = bandpass(c3_c4_seg, [13 30], fs); % beta 13-30Hz

ondas_mi = [mu beta]; %unir o concatenar matrices de mu y beta


p = zeros(n_ejemplos, 4);
j = 1;
for i=1:n_ejemplos
    p(i,:) = bandpower(ondas_mi(j:j+499,:));
    j = j + 500; % 500 por que son 2 segundos a 250 Hz
end

save('MuBeta_B9E.mat','ondas_mi');
csvwrite('BP_B9E.csv',p); % guardar en .csv
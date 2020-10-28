%Edgar Moises Hernandez-Gonzalez
%20/07/20-21/07/20
%CAR (common average reference)
%Input Shape: (n_muestra*1000)x3
%Output Shape: (n_muestra*1000)x3
%canal C4 es el 3
%muestra 2 es derecha para el sujeto 1

clear
clc

load('Limpios_test_9.mat');
promedio = mean(signals_limpias,2);
car = signals_limpias - promedio;
%cambiar sujeto y sesion
save('CarB09E.mat','car');

% % Esto es para graficar la diferencia de la senal al aplicar CAR
% c4 = signals_limpias(1000:2000,3);
% plot(c4,'LineWidth',1);
% hold on
% c4_car = car(1000:2000,3);
% plot(c4_car,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 CAR');
% hold off
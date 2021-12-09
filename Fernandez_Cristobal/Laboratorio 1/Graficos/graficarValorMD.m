function graficarValorMD(vd, vc, vqr)

% Crear Figura
figure1 = figure;

% Crear ejes 
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

plot([vd],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([vc],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
plot([vqr],'+b','MarkerSize',2,'MarkerFaceColor','b'); hold on;
title('Aproximaciones en el sistema')
ylabel('Aproximaciones') % y-axis label
xlabel('Variables') % x-axis label
legend('Cholesky', 'QR' ,'Givens');
end
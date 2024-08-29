%Ejemplo Coincidencia Histrogramas
%Imagenes con escala de grises {0,1,2,3,4,5,6,7}
clc; clear; close all

%Imagen 1 = I1 (tamaño 7x7)
I1=[0   1   7   5   1   4   5;
    2   5   1   0   3   0   6;
    0   0   7   3   2   6   1;
    6   1   2   2   3   2   4;
    1   4   1   2   2   1   4;
    3   4   0   3   6   2   0;
    7   1   7   5   6   3   1];
%Imagen 2 = I2 (tamaño 7x7)
I2=[3   5   2   3   3   4   5;
    4   4   6   2   4   5   7;
    6   5   6   4   5   4   4;
    3   6   2   3   6   5   2;
    4   3   4   2   2   4   7;
    1   4   6   4   3   5   7;
    3   5   2   3   5   6   2];

%Calcular el histograma de I1
h1=zeros(1,8);
for i=0:7
  h1(i+1)=sum(sum(I1==i));
end
subplot(2,3,1)
bar(0:7,h1)
title('Histograma (I1)')
xlim([-1 8])
ylim([0 15])

%Calcular el histograma de I2
h2=zeros(1,8);
for i=0:7
  h2(i+1)=sum(sum(I2==i));
end
subplot(2,3,2)
bar(0:7,h2)
title('Histograma (I2)')
xlim([-1 8])
ylim([0 15])

%Calcular el distribucion acumulada de I1
acI1=zeros(1,8);
[m,n]=size(I1);
for i=0:7
  acI1(i+1)=sum(h1(1:i+1))/(m*n);
end
subplot(2,3,4)
bar(0:7,acI1)
title('Distribucion Acumulada (I1)')
xlim([-1 8])

%Calcular el distribucion acumulada de I2
acI2=zeros(1,8);
[m,n]=size(I2);
for i=0:7
  acI2(i+1)=sum(h2(1:i+1))/(m*n);
end
subplot(2,3,5)
bar(0:7,acI2)
title('Distribucion Acumulada (I2)')
xlim([-1 8])

% Vector asociado despues de obtener
%el minimo comparando distribuciones
%acumuladas entre imagenes
newP=zeros(1,8);
for k=0:7
  [minR,posR]=min(abs(acI1(k+1)-acI2));
  newP(k+1)=posR;
end


newh1=zeros(1,8);
for k=0:7
  aux1=(newP==(k+1));
  aux2=aux1.*h1;
  newh1(k+1)=sum(aux2);
end


%Calcular el histograma nuevo
subplot(2,3,3)
bar(0:7,newh1)
title('Nuevo Histograma (I1)')
xlim([-1 8])
ylim([0 15])

%Creando la nueva imagen, pero ahora
%con la nueva distribucion de tonalidades
%de grises despues del proceso de
%coincidencia de histogramas
%cambiar [0 1 2 3 4 5 6 7] por newP
I3=zeros(7,7);
for i=1:7
  for j=1:7
    I3(i,j)=newP(I1(i,j)+1)-1;
  end
end

%Calcular el histograma de I2
h3=zeros(1,8);
for i=0:7
  h3(i+1)=sum(sum(I3==i));
end
subplot(2,3,6)
bar(0:7,h3)
title('Histograma (I3)')
xlim([-1 8])
ylim([0 15])

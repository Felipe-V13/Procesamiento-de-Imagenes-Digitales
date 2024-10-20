%Aplicacion del operador de Sobel

clc; clear; close all;

A=im2double(imread('columnas.jpg'));
subplot(1,3,1)
imshow(A)
title('Imagen Original')

Bx=[-1 0 1;-2 0 2;-1 0 1];
By=[-1 -2 -1;0 0 0;1 2 1];

Ax=conv2(A,Bx,'same');
Ay=conv2(A,By,'same');

C=sqrt(Ax.^2+Ay.^2);
subplot(1,3,2)
imshow(C)
title('Imagen Convolucion')


%Obtener una imagen binaria (0 ó 255)

pkg load image

D1=im2uint8(C);
D2=D1>64;
subplot(1,3,3)
imshow(D2)











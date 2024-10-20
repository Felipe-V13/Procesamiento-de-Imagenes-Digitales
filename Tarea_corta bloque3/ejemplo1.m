%Aplicacion de filtros paso alto

clc; clear; close all;

A=im2double(imread('baby_yoda.jpg'));
subplot(1,3,1)
imshow(A)

B1=[1 0 1;0 -4 0;1 0 1]; %Filtro Laplaciano
C1=conv2(A,B1,'same');
subplot(1,3,2)
imshow(C1)

B2=[0 1 0;0 0 0;0 -1 0]; %Filtro Direccional (arriba hacia abajo)
C2=conv2(A,B2,'same');
subplot(1,3,3)
imshow(C2)



clear all;
clc;
kid=imread('kid.bmp');
homer=imread('homer.bmp');
homerBin=imread('homerBin.bmp');
text=fopen('english.txt');
[l,c]=audioread('guitarSolo.wav');
info_musica = audioinfo('guitarSolo.wav');
[k,alfa_k,vectk,Hk] = le_im(kid);
[h,alfa_h,vecth,Hh] = le_im(homer);
[hB,alfa_hB,vecthB,HhB] = le_im(homerBin);
[t,alfa_t,vectt,ab,Ht] = le_texto(text);
[g,alfa_g,vectg,Hg]=le_musica(l,info_musica.BitsPerSample);
fclose(text);
faz_histogramas_ex3(uint8(kid),uint8(homer),uint8(homerBin),l,alfa_g,ab,alfa_t);
fprintf("---------- ex 3 --------------\n");
fprintf("Entropia :\nhomerBin.bmp -> %.4f\nhomer.bmp -> %.4f\nkid.bmp -> %.4f\nenglish.txt -> %.4f\nguitarSolo.wav -> %.4f\n",HhB,Hh,Hk,Ht,Hg);
[nmhb,vhb] = calcula_numero_medio(hB);
[nmh,vh] = calcula_numero_medio(h);
[nmk,vk] = calcula_numero_medio(k);
[nmt,vt] = calcula_numero_medio(t);
[nmg,vg] = calcula_numero_medio(g');
fprintf("---------- ex 4 --------------\n");
fprintf("Numero medio:\nhomerBin.bmp -> %.4f\nhomer.bmp -> %.4f\nkid.bmp -> %.4f\nenglish.txt -> %.4f\nguitarSolo.wav -> %.4f\n",nmhb,nmh,nmk,nmt,nmg);
fprintf("\nVariancia:\nhomerBin.bmp -> %.4f\nhomer.bmp -> %.4f\nkid.bmp -> %.4f\nenglish.txt -> %.4f\nguitarSolo.wav -> %.4f\n",vhb,vh,vk,vt,vg);
[H_agrup_t,f_at] = agrupado(vectt,alfa_t);
[H_agrup_h,f_ah] = agrupado(vecth,alfa_h);
[H_agrup_hB,f_ahB] = agrupado(vecthB,alfa_hB);
[H_agrup_k,f_ak] = agrupado(vectk,alfa_k);
[H_agrup_g,f_ag] = agrupado(vectg,alfa_g);
faz_histogramas_ex5(f_at,f_ah,f_ahB,f_ak,f_ag);
fprintf("---------- ex 5 --------------\n");
fprintf("Numero medio:\nhomerBin.bmp -> %.4f\nhomer.bmp -> %.4f\nkid.bmp -> %.4f\nenglish.txt -> %.4f\nguitarSolo.wav -> %.4f\n",H_agrup_hB,H_agrup_h,H_agrup_k,H_agrup_t,H_agrup_g);
query = [2 6 4 10 5 9 5 8 0 8];
target = [6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4  3 2 2 7 3 5 2 7 4 9 9 6]; 
alfabeto = 0 : 10;
mutb = infor_mutua(query,target,alfabeto,1);
fprintf("\n---------- ex 6 a --------------\n");
disp(mutb);
fprintf("\n---------- ex 6 b --------------\n");
[target_r1,target_r1c]=audioread('target01 - repeat.wav');
[target_r2,target_r2c]=audioread('target02 - repeatNoise.wav');
x = 1:9;
mutGuitar = infor_mutua(l',target_r1',alfa_g',floor(length(l)/4));
mutGuitar2 = infor_mutua(l',target_r2',alfa_g',floor(length(l)/4));
fprintf("target01 - repeat.wav -> ");
disp(mutGuitar);
fprintf("target02 - repeatNoise.wav -> ");
disp(mutGuitar2);
figure('name','Evolu��o Informa��o Mutua repeat.wav e repeatNoise.wav','NumberTitle','off');
plot(x,mutGuitar,x,mutGuitar2);

%SIMULADOR
[song_r1,song_r1c]=audioread('Song01.wav');
[song_r2,song_r2c]=audioread('Song02.wav');
[song_r3,song_r3c]=audioread('Song03.wav');
[song_r4,song_r4c]=audioread('Song04.wav');
[song_r5,song_r5c]=audioread('Song05.wav');
[song_r6,song_r6c]=audioread('Song06.wav');
[song_r7,song_r7c]=audioread('Song07.wav');
[song_r8,song_r8c]=audioread('Song08.wav');
[song_r9,song_r9c]=audioread('Song09.wav');
vec_songs = {song_r1',song_r2',song_r3',song_r4',song_r5',song_r6', song_r7',song_r8(:,1)',song_r9(:,1)'};
fprintf("---------- SIMULADOR --------------\n");
infor_mut_max = simulador(l',alfa_g',vec_songs);

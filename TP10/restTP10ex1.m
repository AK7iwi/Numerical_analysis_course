%TP10 ex1bc

f = @(t,y) y*cos(t) + sin(y);

y0 = 1;
T = 10;
h = 0.01;
t = 0:h:10;
yp = eulerp(f,y0,t) ;
yr = eulerr(f,y0,t) ;
figure(1)
plot(t,yp,'g');
hold on;
plot(t,yr,'b');

%Verification avec lsode (outil octave)
f2 = @(y,t) y*cos(t) + sin(y);
yverif = lsode(f2, y0,t);
plot(t,yverif,'r');

%Verifions de la methode d'eulerp soit du 1er ordre
%Pour ce faire, 3 solutions numériques correspondant à h = 0.1, 0.05 et à 0.001 pour faire office de solution exacte

h1 = 0.1;
t1 = 0:h1:T;
yp1 = eulerp(f,y0,t1);  %1re solution numérique

h2 = 0.05 ;
t2 = 0:h2:T;
yp2 = eulerp(f,y0,t2);  %2eme solution numérique pour un pas 2x plus petit 

h3 = 0.001 ;
t3 = 0:h3:T;
yp3 = eulerp(f,y0,t3);  %solution exacte

err1 = abs(yp1 -yp3(1:100:end));
err2 = abs(yp2 - yp3(1:50:end)); %car 0.001 s rentre 50x dans 0.05 s

figure(2)
plot(t1, err1, 'g')
hold on 
plot(t2,err2,'b')

%D'apres la figure(2), l'erreur semble avoir été divisé par 2, et puisque 
%le pas a été divisé par 2, cela montre que eulerp est du 1er ordre
%Le calcul suivant permet d'étayer cette conclusion :
norm(err1,'inf') / norm(err2, 'inf') 
%ans = 1.9156 est assez priche de 2

function tp6pb

x = [1,2,3,4,5,6];
f = rand(length(x),1);
plot(x,f,'*r'); hold on;
   % construire la fonction d'interpolation 
s = spl_interpol(x,f);
   % repr�senter la fonction d'interpolation 
xr = x(1)+[0:0.01:1]*(x(end)-x(1));
for i = 1:length(xr)
    fr(i) = spl_eval(xr(i), x, s);
end
plot(xr,fr)
hold off
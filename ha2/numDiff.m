function y = numDiff(func,x,Methode)
if strcmp(Methode,'Vorwärtsdifferenzierung')
h = 1e-8;
y = (func(x+h)-func(x))/h;
elseif strcmp(Methode,'Rückwärtsdifferenzierung')
   h = 1e-8;
   y = (func(x)-func(x-h))/h; 
else
    h = 1e-6;
    y = (func(x+h)-func(x-h))/(2*h);
end
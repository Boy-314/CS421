x = 1.0;
h = 1.0;
h_vec = [];
error_vec = [];
deriv = cos(x);
disp(deriv)
sprintf('\t\t\t\t\th\t\t\t\t\tdiffquo\t\t\tabs(deriv - diffquo)')
for n = 1:20
    h = h/10;
    h_vec = [h_vec, h];
    %diffquo = (sin(x + h) - sin(x))/h;
    diffquo = (sin(x + h) - sin(x - h))/(2*h);
    error = abs(deriv - diffquo);
    error_vec = [error_vec, error];
    format long g
    disp([h, diffquo, error])
end
loglog(h_vec,error_vec,'*')
xlabel('h')
ylabel('error: abs(derivative - difference quotient)')
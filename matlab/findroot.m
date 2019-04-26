function [r,iterates,info] = findroot(a,b,f,fderiv)
% finds a root of a continuously differentiable function f of one variable
% using a hybrid of the bisection method and Newton's method. The inputs
% should be two numbers a and b with a < b and f(a)f(b) <= 0 and two
% "anonymous functions" f and fderiv, which are to be used to evaluate f
% and its derivative f'. findroot should return an output r, which is
% supposed to be a root of f with the highest possible accuracy, with a <=
% r <= b, along with a vector iterates of all the iterates x_k where f was
% evaluated, (excluding the inputs a and b), each of which is either a
% Newton iterate x^N or a bisection iterate x^B, with the last iterate
% equaling r, as well as another vector info with components set to 0 when
% the corresponding itaret x_k was computed by bisection or 1 when it was
% computed by Newton. this program should update the left end point a and
% the right end point b so that they always satisfy a < b and f(a)f(b) < 0,
% and it should save the values f(a) and f(b) so f does not have to be
% evaluated at any point more than once. Also it keeps track of whether f
% was evaluated most recently at a or at b: initially, it's set to a.

% f_eval = 1 or 0, 0 for if f was most recently evaluated at a, 1 for if f
% was most recently evaluated at b
f_prev = a;
% tau, used for testing when to terminate
tau = 10e-15;
% iterations, iteration counter to prevent infinite loops
iterations = 1;
% store f(a) and f(b)
fa = f(a);
fb = f(b);
% quit if f(a) or f(b) equals 0
if fa == 0
    r = a;
    return
end
if fb == 0
    r = b;
    return
end
% quit if f(a)f(b) > 0
if fa*fb > 0
    r = NaN;
    return
end
% initial values for x_new, and x_k
x_new = a;
x_k = b;
% loop over the condition |x_{k+1}-x_k|/max(1,|x_k|)<=tau
while abs(x_new-x_k)/max(1,abs(x_k)) >= tau
    % compute Newton update x^N
    % set x according to f_eval. xk is the old value from last iteration
    xN = f_prev - f(f_prev)/fderiv(f_prev);
    % update x_k
    x_k = f_prev;
    % reject xN if it lies outside the interval [a,b] and replace it with
    % the bisection point x^B=(a+b)/2 instead.
    if xN < a || xN > b
        xB = (a+b)/2;
        % evaluate f at xB
        fx_new = f(xB);
        xN = xB;
        % update info and iterates vector
        info(iterations) = 0;
        iterates(iterations) = xN;
    else
        % evaluate f at xN
        fx_new = f(xN);
        % update info and iterates vector
        info(iterations) = 1;
        iterates(iterations) = xN;
    end
    
    % if f_new matches sign with a, replace a
    if sign(fx_new) == sign(fa)
        a = xN;
        f_prev = a;
        fa = fx_new;
    else
        b = xN;
        f_prev = b;
        fb = fx_new;
    end
    % update r
    r = f_prev;
    % store x_new
    x_new = xN;
    % terminate if iterations > 1000
    if iterations > 1000
        break
    end
    iterations = iterations + 1;
end
end


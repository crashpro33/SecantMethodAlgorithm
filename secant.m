% Inputs:
% fun: A polynomial in the form of a function handle. Ex: @(x) x^2
% x0: The first initial value
% x1: The second initial value
% tol: When the difference of x1 and xn goes below this level of precision,
% the function stops as we have found the root
% nmax: The maximum number of iterations of calculating xn before stopping due to lack of convergence

% Outputs:
% n: The number of iterations required to find a root
% r: the root that was found

% The following is an example of how this function might be called

% The following is an example of how this function might be called
% >> [n, r] = secant (@(x)(x^3 + 2*x -6), 1, 2, 0.001, 100)

function [n, r] = secant(fun, x0, x1, tol, nmax)

% xn uses a simplification of the secant method
% the original secant method is x = x1 - f(x1)[(x1-x0)/(f(x1)-f(x0))]
% x1 can be turned into a fraction using like denominators and combined with the rest
% xn is the result of that simplifying
xn = (x0 * fun(x1) - x1 * fun(x0)) / (fun(x1) - fun(x0));

iterations = 1; % initialize number of iterations at 1 because we calculate xn before the loop 
while iterations <= nmax % while the number of iterations is less than or equal to the maxiumum allowed, continue executing
    x0 = x1; % x0 becomes x1
    x1 = xn; % x1 becomes xn
    xn = (x0 * fun(x1) - x1 * fun(x0)) / (fun(x1) - fun(x0)); % calculate xn
    iterations = iterations + 1; % increment the number of iterations by 1
    if (abs(xn - x1) < tol) % if the difference between the new and old calculations of x is less than our tolerance
       break; % exit the while loop because we found a root matching our precision
    end % end if
    if(iterations >= nmax) % if the maximum number of iterations has been reached
        error('The maximum iterations have been reached without convergence'); % tell the user that the max has been reached without convergence and exit
    end % end if
end % end while

% map the calculated variables with the proper output variables
n = iterations; % n is the number of iterations to find the root
r = xn; % r is the root which is found when the function is evaluated at xn and less than the tolerance

% print the output variables
fprintf('n is %d\n', n); % print n
fprintf('r is %d\n', r); % print r

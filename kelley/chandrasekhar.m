function f = chandrasekhar ( h )

%% CHANDRASEKHAR evaluates the discretized Chandrasekhar H function.
%
%  Discussion:
%
%    The Chandrasekhar H function is
%
%      F(H)(mu) = H(mu) 
%        - 1 / ( 1 - c/2 * Integral ( 0 <= nu <= 1 ) [ mu * H(mu) / ( mu + nu ) ] dnu )
%
%    Applying the composite midpoint rule, and setting, for i = 1 to N,
%
%      mu(i) = ( i - 0.5 ) / N
%
%    we have the discrete function
%
%      F(h(i)) = h(i) 
%        - 1 / ( 1 - c/(2N) * sum ( 1 <= j <= N ) ( mu(i) * h(j) / ( mu(i) + mu(j) ) )
%
%  Modified:
%
%    23 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Subramanyan Chandrasekhar,
%    Radiative Transfer,
%    Dover, 1960,
%    ISBN13: 978-0486605906,
%    LC: QB461.C46.
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%    
%  Parameters:
%
%    Input, real H(N), the argument of the function.
%
%    Output, real F(N), the value of the function.
%
  c = 0.9;

  n = length ( h );
  f(1:n,1) = h(1:n,1);
%
%  Matlab's persnicketyness amazes me sometimes.
%
  mu(1:n,1) = (1:n)';
  mu(1:n,1) = ( mu(1:n,1) - 0.5 ) / n;

  for i = 1 : n

    term = 1.0 - c / ( 2.0 * n ) ...
      * sum ( mu(i,1) * h(1:n,1) ./ ( mu(i,1) + mu(1:n,1) ) );

    f(i,1) = f(i,1) - 1.0 / term;

  end

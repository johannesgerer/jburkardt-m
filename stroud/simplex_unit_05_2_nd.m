function result = simplex_unit_05_2_nd ( func, n )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_05_2_ND approximates an integral inside a unit simplex in ND.
%
%  Integration region:
%
%    The unit simplex in N dimensions,
%      0 <= X(1:N),
%      Sum ( X(1:N) ) <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Axel Grundmann, H M Moller,
%    Invariant Integration Formulas for the N-Simplex by Combinatorial Methods,
%    SIAM Journal on Numerical Analysis,
%    Volume 15, Number 2, April 1978, pages 282-290.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X) at the N-dimensional point
%    X, of the form
%      function func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0;
%
%  Group 1
%
  x(1:n) = 1.0E+00 / ( n + 1 );
  coef = ( ( n + 1 )^4 ) / ( 32 * ( n + 2 ) * ( n + 3 ) );
  quad = quad + coef * feval ( func, n, x );
%
%  Group 2
%
  a = 1.0E+00 / ( n + 3 );
  b = 3.0E+00 / ( n + 3 );

  x(1:n) = a;
  coef = - ( ( n + 3 )^4 ) ...
    / ( 16 * ( n + 1 ) * ( n + 2 ) * ( n + 4 ) );
  quad = quad + coef * feval ( func, n, x );

  for i = 1 : n

    x(i) = b;
    quad = quad + coef * feval ( func, n, x );
    x(i) = a;

  end
%
%  Group 3
%
  a = 1.0E+00 / ( n + 5 );
  b = 5.0E+00 / ( n + 5 );

  x(1:n) = a;
  coef = ( ( n + 5 )^4 ) ...
    / ( 16 * ( n + 1 ) * ( n + 2 ) * ( n + 3 ) * ( n + 4 ) );
  quad = quad + coef * feval ( func, n, x );

  for i = 1 : n

    x(i) = b;
    quad = quad + coef * feval ( func, n, x );
    x(i) = a;

  end
%
%  Group 4
%
  a = 1.0E+00 / ( n + 5 );
  b = 3.0E+00 / ( n + 5 );

  coef = ( ( n + 5 )^4 ) ...
    / ( 16 * ( n + 1 ) * ( n + 2 ) * ( n + 3 ) * ( n + 4 ) );

  for i = 1 : n

    x(1:n) = a;
    x(i) = b;
    quad = quad + coef * feval ( func, n, x );

    for j = i+1 : n
      x(j) = b;
      quad = quad + coef * feval ( func, n, x );
      x(j) = a;
    end

  end

  volume = simplex_unit_volume_nd ( n );

  result = quad * volume;

  return
end

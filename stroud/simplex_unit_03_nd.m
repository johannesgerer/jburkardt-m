function result = simplex_unit_03_nd ( func, n )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_03_ND approximates an integral inside a unit simplex in ND.
%
%  Integration region:
%
%    The unit simplex in N dimensions,
%      0 <= X(1:N),
%      Sum ( X(1:N) ) <= 1.
%
%  Discussion:
%
%    An N+2 point formula of degree 3 is used.  This is Stroud TN:3-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
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
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X) at the N-dimensional point
%    X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0;

  x(1:n) = 1.0 / ( n + 1 );
  coef = - 0.2 * ( n + 1 ) * ( n + 1 ) / ( n + 2 );
  quad = quad + coef * feval ( func, n, x );

  a = 1.0 / ( n + 3 );
  b = 3.0 / ( n + 3 );

  x(1:n) = a;
  coef = 0.25 * ( n + 3 ) * ( n + 3 ) / ( ( n + 1 ) * ( n + 2 ) );
  quad = quad + coef * feval ( func, n, x );

  for i = 1 : n

    x(i) = b;
    quad = quad + coef * feval ( func, n, x );
    x(i) = a;

  end

  volume = simplex_unit_volume_nd ( n );

  result = quad * volume;

  return
end

function result = simplex_unit_01_nd ( func, n )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_01_ND approximates an integral inside a unit simplex in ND.
%
%  Integration region:
%
%    The unit simplex in N dimensions,
%      0 <= X(1:N),
%      Sum ( X(1:N) ) <= 1.
%
%  Discussion:
%
%    An 1 point formula of degree 1 is used.
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
  coef = 1.0E+00;
  quad = 0.0E+00;

  x(1:n) = 1.0E+00 / n;
  quad = quad + coef * feval ( func, n, x );

  volume = simplex_unit_volume_nd ( n );

  result = quad * volume;

  return
end

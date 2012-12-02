function value = qmult_1d ( func, a, b )

%*****************************************************************************80
%
%% QMULT_1D approximates an integral over an interval in 1D.
%
%  Integration region:
%
%    Points X such that:
%
%      A <= X <= B.
%
%  Discussion:
%
%    A 16 point 31-st degree Gauss-Legendre formula is used.
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
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X), of the form
%      function value = func ( x )
%
%    Input, real A, B, the lower and upper limits of integration.
%
%    Output, real VALUE, the approximate integral of
%    the function.
%
  norder = 16;

  [ xtab, weight ] = legendre_set ( norder );

  quad = 0.0;
  for i = 1 : norder
    x = 0.5 * ( b - a ) * xtab(i) + 0.5 * ( a + b );
    quad = quad + 0.5 * weight(i) * feval ( func, x );
  end

  volume = b - a;
  value = quad * volume;

  return
end

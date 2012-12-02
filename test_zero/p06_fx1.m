function fx1 = p06_fx1 ( x )

%*****************************************************************************80
%
%% P06_FX1 evaluates the derivative of the function for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the abscissa.
%
%    Output, real FX1, the first derivative of the function at X.
%
  fx1 = exp ( x ) + 2.0 / ( 100.0 * x * x * x ) - 6.0 / ( 1000000.0 * x.^4 );

  return
end

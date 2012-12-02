function fx2 = p06_fx2 ( x )

%*****************************************************************************80
%
%% P06_FX2 evaluates the second derivative of the function for problem 6.
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
%    Output, real FX2, the second derivative of the function at X.
%
  fx2 = exp ( x ) - 6.0 / ( 100.0 * x.^4 ) + 24.0 / ( 1000000.0 * x.^5 );

  return
end

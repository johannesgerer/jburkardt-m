function value = fx2sd1 ( x )

%*****************************************************************************80
%
%% FX2SD1 evaluates the function x**2 / sqrt ( 1.1 - x**2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the function.
%
%    Output, real FX2SD1, the value of the function.
%
  value = x * x / sqrt ( 1.1 - x * x );

  return
end

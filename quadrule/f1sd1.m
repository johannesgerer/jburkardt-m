function value = f1sd1 ( x )

%*****************************************************************************80
%
%% F1SD1 evaluates the function 1.0D+00/ sqrt ( 1.1 - x**2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the function.
%
%    Output, real VALUE, the value of the function.
%
  f1sd1 = 1.0 / sqrt ( 1.1 - x * x );

  return
end

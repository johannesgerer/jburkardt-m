function value = f1 ( x )

%*****************************************************************************80
%
%% F1 evaluates 23 * cosh ( x ) / 25 - cos ( x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the value of the function.
%
  value = 23.0 * cosh ( x ) / 25.0 - cos ( x );

  return
end

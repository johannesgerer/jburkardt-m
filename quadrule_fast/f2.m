function value = f2 ( x )

%*****************************************************************************80
%
%% F2 evaluates 1 / ( x^4 + x^2 + 0.9 ).
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
  value = 1.0 ./ ( x.^4 + x.^2 + 0.9 );

  return
end

function value = f3 ( x )

%*****************************************************************************80
%
%% F3 evaluates sqrt ( abs ( x + 1/2 ) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2006
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
%    Output, real F3, the value of the function.
%
  value = sqrt ( abs ( x + 0.5 ) );

  return
end

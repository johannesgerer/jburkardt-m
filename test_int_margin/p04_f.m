function f = p04_f ( n, x )

%*****************************************************************************80
%
%% P04_F returns the integrand for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the arguments.
%
%    Output, real F(N), the values of the integrand.
%
  f = 0.75 * x + 1.25 * sin ( 3.0 * pi * x + 0.4 );

  return
end

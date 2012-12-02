function f = p02_f ( n, x )

%*****************************************************************************80
%
%% P02_F returns the integrand for problem 2.
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
  f = 0.5 + 1.5 * ( 0.6 <= x & x <= 0.7 );

  return
end

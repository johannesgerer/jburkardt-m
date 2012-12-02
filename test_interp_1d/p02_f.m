function value = p02_f ( n, x )

%*****************************************************************************80
%
%% P02_F evaluates the function for problem p01.
%
%  Discussion:
%
%    Nondifferentiable function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real VALUE(N,1), the function values.
%
  value = zeros ( size ( x ) );

  i = find ( x <= 1.0 / 3.0 );
  j = find ( 1.0 / 3.0 < x );

  value(i) = 1.0 - 3.0 * x(i);
  value(j) = 6.0 * x(j) - 2.0;

  return
end

function value = p01_f ( n, x )

%*****************************************************************************80
%
%% P01_F evaluates the function for problem p01.
%
%  Discussion:
%
%    Step function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2012
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
  value = 2.0 * ones ( size ( x ) );

  i = find ( x <= 1.0 / 3.0 );
  j = find ( 4.0 / 5.0 <= x );

  value(i) = -1.0;
  value(j) = +1.0;

  return
end

function f = p07_f ( n, x )

%*****************************************************************************80
%
%% P07_F evaluates the function for problem p07.
%
%  Discussion:
%
%    f(x) = exp ( 4 * x ) if x <= 1/2
%           0                  otherwise
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
%  Reference:
%
%    Alan Genz,
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real F(N,1), the function values.
%
  f = zeros ( n, 1 );

  i = find ( x < 0.5 );

  f(i) = exp ( 4.0 * x(i) );

  return
end

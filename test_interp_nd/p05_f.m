function f = p05_f ( m, c, w, n, x )

%*****************************************************************************80
%
%% P05_F evaluates the function for problem p05.
%
%  Discussion:
%
%    f(x) = exp ( - sum ( c(1:m) * abs ( x(1:m) - w(1:m) ) ) )
%
%    Default values are:
%
%    c(1:m) = 2.0
%    w(1:m) = 0.5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2012
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
%    Reidel, 1987, pages 337-340,
%    ISBN: 9027725144,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, real C(M,1), W(M,1), the problem parameters.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the evaluation points.
%
%    Output, real F(N.1), the function values.
%
  f = zeros ( n, 1 );

  for i = 1 : m
    f = f + c(i) * abs ( x(i,:)' - w(i) );
  end
  f = exp ( - f );

  return
end

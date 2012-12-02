function f = p02_f ( m, c, w, n, x )

%*****************************************************************************80
%
%% P02_F evaluates the function for problem p02.
%
%  Discussion:
%
%    f(x) = 1 / product ( c(1:m)^(-2) + ( x(1:m) - w(1:m) )^2 )
%
%    Default values are:
%
%    c(1:m) = 1
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
%    Output, real F(N,1), the function values.
%
  f = ones ( n, 1 );
  for i = 1 : m
    f = f .* ( c(i) ^ (-2) + ( x(i,:)' - w(i) ) .^ 2 );
  end
  f = 1.0 ./ f;

  return
end

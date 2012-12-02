function f = p03_f ( m, c, w, n, x )

%*****************************************************************************80
%
%% P03_F evaluates the function for problem p03.
%
%  Discussion:
%
%    f(x) = 1 / ( 1 + sum ( c(1:m) * x(1:m) ) ) ^ ( m + 1 )
%
%    Default values are:
%
%    c(1:m) = 1/m
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
    f = f + c(i) .* x(i,:)';
  end
  f = 1.0 ./ f .^ ( m + 1 );

  return
end

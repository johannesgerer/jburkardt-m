function d = p03_d ( m, id, c, w, n, x )

%*****************************************************************************80
%
%% P03_D evaluates a derivative for problem p03.
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
%    Input, integer ID, the spatial coordinate to be differentiated.
%
%    Input, real C(M,1), W(M,1), the problem parameters.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the evaluation points.
%
%    Output, real D(N,1), the value of the ID-th derivative component at X.
%
  d = ones ( n, 1 );

  for i = 1 : m 
    d = d + c(i) .* x(i,:)';
  end
  d = - ( m + 1 ) ./ d .^ ( m + 2 ) .* c(id);

  return
end

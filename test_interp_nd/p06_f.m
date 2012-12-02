function f = p06_f ( m, c, w, n, x )

%*****************************************************************************80
%
%% P06_F evaluates the function for problem p06.
%
%  Discussion:
%
%    f(x) = exp ( c(1:m) * x(1:m) ) if x(1) <= w(1) and x(2) <= w(2).
%           0                          otherwise
%
%    Default values are:
%
%    c(1:m) = 0.5^(1/m)
%    w(1:2) = 0.5^(1/m)
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
  if ( m == 1 )
    f = c(1) * x(1,:)';
    f = exp ( f ) .* ( x(1,:)' <= w(1) );
  else
    f = zeros ( n, 1 );
    for i = 1 : m
      f = f + c(i) * x(i,:)';
    end
    f = exp ( f ) .* ( x(1,:)' <= w(1) & x(2,:)' <= w(2) );
  end

  return
end

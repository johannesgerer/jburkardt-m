function h = p06_h ( n, x )

%*****************************************************************************80
%
%% P06_H evaluates the Hessian for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  f1 = 0.0;
  for i = 1 : n
    f1 = f1 + i * ( x(i) - 1.0 );
  end

  for i = 1 : n
    df1dxi = i;
    d2f2dxii = 2.0;
    for j = 1 : n
      df1dxj = j;
      h(i,j) = ( 2.0 + 12.0 * f1 * f1 ) * df1dxi * df1dxj;
    end
    h(i,i) = h(i,i) + d2f2dxii;
  end

  return
end

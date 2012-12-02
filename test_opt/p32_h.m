function h = p32_h ( n, x )

%*****************************************************************************80
%
%% P32_H evaluates the Hessian for problem 32.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2001
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

  m = 7;
  a = [ 
    4.0, 4.0, 4.0, 4.0; ...
    1.0, 1.0, 1.0, 1.0; ...
    8.0, 8.0, 8.0, 8.0; ...
    6.0, 6.0, 6.0, 6.0; ...
    3.0, 7.0, 3.0, 7.0; ...
    2.0, 9.0, 2.0, 9.0; ...
    5.0, 5.0, 3.0, 3.0 ]';

  c = [ 0.1, 0.2, 0.2, 0.4, 0.6, 0.6, 0.3 ]';

  for ii = 1 : n
    for jj = 1 : n
      for j = 1 : m
        d = c(j) + sum ( ( x(1:n) - a(1:n,j) ).^2 );
        h(ii,jj) = h(ii,jj) - 8.0 * ( x(ii) - a(ii,j) ) * ( x(jj) - a(jj,j) ) / d^3;
        if ( ii == jj )
          h(ii,jj) = h(ii,jj) + 2.0 / d^2;
        end
      end
    end
  end

  return
end

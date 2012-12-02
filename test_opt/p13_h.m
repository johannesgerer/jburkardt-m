function h = p13_h ( n, x )

%*****************************************************************************80
%
%% P13_H evaluates the Hessian for problem 13.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
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

  s1 = sum ( cos ( x(1:n) ) );

  for j = 1 : n
    h(j,j) = sin ( x(j) );
  end

  s2 = 0.0;

  for j = 1 : n

    th = cos ( x(j) );
    t = ( n + j ) - h(j,j) - s1 - j * th;
    s2 = s2 + t;
    for k = 1 : j - 1
      h(j,k) = 2.0 * ( sin ( x(k) ) * ( ( n + j + k ) * h(j,j) - th ) - ...
        h(j,j) * cos ( x(k) ) );
    end

    h(j,j) =  ( j * ( j + 2 ) + n ) * h(j,j) * h(j,j) + th * ...
      ( th -  ( 2 * j + 2 ) * h(j,j) ) + t * ( j * th + h(j,j) );

  end

  for j = 1 : n
    h(j,j) = 2.0 * ( h(j,j) + cos ( x(j) ) * s2 );
  end

  for i = 1 : n
    h(i,i+1:n) = h(i+1:n,i);
  end

  return
end

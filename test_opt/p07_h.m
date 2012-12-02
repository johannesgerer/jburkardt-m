function h = p07_h ( n, x )

%*****************************************************************************80
%
%% P07_H evaluates the Hessian for problem 7.
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

  for i = 1 : 29

    d1 = i / 29.0;
    d2 = 1.0;
    s1 = 0.0;
    s2 = x(1);
    for j = 2 : n
      s1 = s1 + ( j - 1 ) * d2 * x(j);
      d2 = d1 * d2;
      s2 = s2 + d2 * x(j);
    end
    t = 2.0 * ( s1 - s2 * s2 - 1.0 ) * d1 * d1;
    s3 = 2.0 * d1 * s2;
    d2 = 1.0 / d1;
    for j = 1 : n
      t1 = j - 1 - s3;
      h(j,j) = h(j,j) + 2.0 * ( t1 * t1 - t ) * d2 * d2;
      d3 = 1.0 / d1;
      for k = 1 : j - 1
        h(j,k) = h(j,k) + 2.0 * ( t1 * ( ( k - 1 ) - s3 ) - t ) * d2 * d3;
        d3 = d1 * d3;
      end
      d2 = d1 * d2;
    end

  end

  t3 = x(2) - x(1) * x(1) - 1.0;
  h(1,1) = h(1,1) + 2.0 - 4.0 * ( t3 - 2.0 * x(1) * x(1) );
  h(2,2) = h(2,2) + 2.0;
  h(2,1) = h(2,1) - 4.0 * x(1);

  for i = 1 : n
    h(i,i+1:n) = h(i+1:n,i);
  end

  return
end

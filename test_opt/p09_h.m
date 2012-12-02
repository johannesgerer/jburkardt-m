function h = p09_h ( n, x )

%*****************************************************************************80
%
%% P09_H evaluates the Hessian for problem 9.
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
  ap = 0.00001;

  t1 = - 1.0;
  for j = 1 : n
    t1 = t1 + ( n - j + 1 ) * x(j) * x(j);
  end

  d1 = exp ( 0.1 );
  d2 = 1.0;
  s2 = 0.0;
  th = 4.0 * t1;

  for j = 1 : n

    h(j,j) = 8.0 * ( ( n - j + 1 ) * x(j) )^2 + ( n - j + 1 ) * th;

    s1 = exp ( x(j) / 10.0 );

    if ( 1 < j )

      s3 = s1 + s2 - d2 * ( d1 + 1.0 );
      h(j,j) = h(j,j) + ap * s1 * ( s3 + s1 - 1.0 ...
        / d1 + 2.0 * s1 ) / 50.0;
      h(j-1,j-1) = h(j-1,j-1) + ap * s2 * ( s2 + s3 ) / 50.0;
      for k = 1 : j - 1
        t1 = exp ( k / 10.0 );
        h(j,k) = 8.0 * ( n - j + 1 ) *  ( n - k + 1 ) * x(j) * x(k);
      end

      h(j,j-1) = h(j,j-1) + ap * s1 * s2 / 50.0;

    end

    s2 = s1;
    d2 = d1 * d2;

  end

  h(1,1) = h(1,1) + 2.0;

  for i = 1 : n
    h(i,i+1:n) = h(i+1:n,i);
  end

  return
end

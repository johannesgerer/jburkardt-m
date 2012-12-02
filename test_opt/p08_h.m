function h = p08_h ( n, x )

%*****************************************************************************80
%
%% P08_H evaluates the Hessian for problem 8.
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

  t1 = - 0.25 + sum ( x(1:n).^2 );

  d1 = 2.0 * ap;
  th = 4.0 * t1;

  for i = 1 : n
    h(i,i) = d1 + th + 8.0 * x(i)^2;
    for j = 1 : i - 1
      h(i,j) = 8.0 * x(i) * x(j);
    end
  end

  for i = 1 : n
    for j = i + 1 : n
      h(i,j) = h(j,i);
    end
  end

  return
end

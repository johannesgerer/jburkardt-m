function h = p18_h ( n, x )

%*****************************************************************************80
%
%% P18_H evaluates the Hessian for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2000
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

  fvec = p18_fvec ( n, x );

  d1 = 1.0 / n;
  d2 = 2.0 * d1;

  for j = 1 : n

    h(j,j) = 4.0 * d1;
    t1 = 1.0;
    t2 = 2.0 * x(j) - 1.0;
    t = 2.0 * t2;
    s1 = 0.0;
    s2 = 2.0;
    p1 = 0.0;
    p2 = 0.0;
    gvec(1) = s2;

    for i = 2 : n
      th = 4.0 * t2 + t * s2 - s1;
      s1 = s2;
      s2 = th;
      th = t * t2 - t1;
      t1 = t2;
      t2 = th;
      th = 8.0 * s1 + t * p2 - p1;
      p1 = p2;
      p2 = th;
      gvec(i) = s2;
      h(j,j) = h(j,j) + fvec(i) * th + d1 * s2 * s2;
    end

    h(j,j) = d2 * h(j,j);

    for k = 1 : j - 1

      h(j,k) = 0.0;
      tt1 = 1.0;
      tt2 = 2.0 * x(k) - 1.0;
      tt = 2.0 * tt2;
      ss1 = 0.0;
      ss2 = 2.0;

      for i = 1 : n
        h(j,k) = h(j,k) + ss2 * gvec(i);
        tth = 4.0 * tt2 + tt * ss2 - ss1;
        ss1 = ss2;
        ss2 = tth;
        tth = tt * tt2 - tt1;
        tt1 = tt2;
        tt2 = tth;
      end

      h(j,k) = d2 * d1 * h(j,k);

    end

  end

  for i = 1 : n
    h(i,i+1:n) = h(i+1:n,i);
  end

  return
end

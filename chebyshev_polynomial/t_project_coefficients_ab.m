function c = t_project_coefficients_ab ( n, f, a, b )

%*****************************************************************************80
%
%% T_PROJECT_COEFFICIENTS_AB: function projected onto T(n,x) over [a,b].
%
%  Discussion:
%
%    It is assumed that the interval of definition is a <= x <= b.
%
%    Over this interval, f(x) will be well approximated by
%
%      f(x) approx sum ( 0 <= i <= n ) c(i) * T(i,(2x-a-b)/(b-a))
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%
%    Input, function handle F, of the form
%      function v = f ( x )
%
%    Input, real A, B, the interval of definition.
%
%    Output, real C(N+1,1), the projection coefficients of f(x) onto
%    T(0,x) through T(n,x), based on [A,B].
%
  for k = 1 : n + 1

    t = cos ( pi * ( k - 0.5 ) / ( n + 1 ) );

    y = ( ( 1.0 + t ) * b   ...
        + ( 1.0 - t ) * a ) ...
        /   2.0;

    d(k) = f ( y );

  end

  fac = 2.0 / ( n + 1 );
  for j = 1 : ( n + 1 )
    sum = 0.0;
    for k = 1 : ( n + 1 )
      sum = sum + d(k) * cos ( ( pi * ( j - 1 ) ) * ( ( k - 0.5 ) / ( n + 1 ) ) );
    end
    c(j) = fac * sum;
  end

  c(1) = c(1) / 2.0;

  return
end


function c = t_project_coefficients ( n, f )

%*****************************************************************************80
%
%% T_PROJECT_COEFFICIENTS: function projected onto T(0:n,x).
%
%  Discussion:
%
%    It is assumed that the interval of definition is -1 <= x <= +1.
%
%    Over this interval, f(x) will be well approximated by
%
%      f(x) approx sum ( 0 <= i <= n ) c(i) * T(i,x)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2012
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
%    Output, real C(N+1,1), the projection coefficients of f(x) onto
%    T(0,x) through T(n,x).
%
  for k = 1 : n + 1
    y = cos ( pi * ( k - 0.5 ) / ( n + 1 ) );
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


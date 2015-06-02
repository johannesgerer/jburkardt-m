function cpv_test02 ( )

%*****************************************************************************80
%
%% CPV_TEST02 is another test.
%
%  Discussion:
%
%    We seek
%      CPV ( Integral ( 1-delta <= t <= 1+delta ) 1/(1-t)^3 dt )
%    which we must rewrite as
%      CPV ( Integral ( 1-delta <= t <= 1+delta ) 1/(1+t+t^2) 1/(1-t) dt )
%    so that our "integrand" is 1/(1+t+t^2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CPV_TEST02:\n' );
  fprintf ( 1, '  Compute CPV ( Integral ( 1-delta <= t <= 1+delta ) 1/(1-t)^3 dt )\n' );
  fprintf ( 1, '  Try this for delta = 1, 1/2, 1/4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N          Estimate                  Exact                  Error\n' );
  delta = 1.0;
  for k = 1 : 3
    fprintf ( 1, '\n' );
    r1 = (   delta + 1.5 ) ^ 2 + 0.75;
    r2 = ( - delta + 1.5 ) ^ 2 + 0.75;
    r3 = atan ( sqrt ( 0.75 ) / (   delta + 1.5 ) );
    r4 = atan ( sqrt ( 0.75 ) / ( - delta + 1.5 ) );
    exact = - log ( r1 / r2 ) / 6.0 + ( r3 - r4 ) / sqrt ( 3.0 );
    for n = 2 : 2 : 8
      a = 1.0 - delta;
      b = 1.0 + delta;
      value = cpv ( @f02, a, b, n );
      fprintf ( 1, '  %2d  %24.16g  %24.16g  %14.6g\n', n, value, exact, abs ( exact - value ) );
    end
    delta = delta / 2.0;
  end

  return
end
function value = f02 ( t )

%*****************************************************************************80
%
%% F02: integrand of Integral ( 1-delta <= t <= 1+delta ) 1/(1-t^3) dt
%
%  Discussion:
%
%    1/(1-t^3) = 1/(1+t+t^2) * 1/(1-t)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
  value = 1.0 ./ ( 1.0 + t + t.^2 );

  return
end

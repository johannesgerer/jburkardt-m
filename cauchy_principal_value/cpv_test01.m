function cpv_test01 ( )

%*****************************************************************************80
%
%% CPV_TEST01 seeks the CPV of Integral ( -1 <= t <= 1 ) exp(t) / t dt
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
  fprintf ( 1, 'CPV_TEST01:\n' );
  fprintf ( 1, '  CPV of Integral ( -1 <= t <= 1 ) exp(t) / t dt\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N           Estimate             Error\n' );
  fprintf ( 1, '\n' );
  exact = 2.11450175075;
  a = -1.0;
  b = +1.0;
  for n = 2 : 2 : 8
    value = cpv ( @f01, a, b, n );
    fprintf ( 1, '  %2d  %24.16g  %14.6g\n', n, value, abs ( value - exact ) );
  end

  return
end
function value = f01 ( t )

%*****************************************************************************80
%
%% F01 evaluates the integrand of Integral ( -1 <= t <= 1 ) exp(t) / t dt
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
%    Input, real T, the argument.
%
%    Output, real VALUE, the value of the integrand.
%
  value = exp ( t );

  return
end

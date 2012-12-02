function stochastic_tk_test01 ( )

%*****************************************************************************80
%
%% STOCHASTIC_RK_TEST01 tests RK1_TI_STEP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  t0 = 0.0;
  tn = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_RK_TEST01\n' );
  fprintf ( 1, '  RK1_TI_STEP uses a first order RK method\n' );
  fprintf ( 1, '  for a problem whose right hand side does not\n' );
  fprintf ( 1, '  depend explicitly on time.\n' );

  h = ( tn - t0 ) / n;
  q = 1.0;
  seed = 123456789;

  x = zeros ( n + 1, 1 );

  i = 0;
  t = t0;
  x(i+1) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         I           T             X\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8d  %14f  %14e\n', i, t, x(i+1) );

  for i = 1 : n

    t = ( ( n - i ) * t0   ...
        + (     i ) * tn ) ...
        / ( n      );

    [ x(i+1), seed ] = rk1_ti_step ( x(i), t, h, q, @fi, @gi, seed );

    fprintf ( 1, '  %8d  %14f  %14e\n', i, t, x(i+1) );

  end

  return
end

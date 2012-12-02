function test04 ( m, n )

%*****************************************************************************80
%
%% TEST04 estimates integrals in M dimensions, using N points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of evaluation points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  P00_Q returns the integral of F over [0,1]^m.\n' );
  fprintf ( 1, '  Here, we use spatial dimension M = %d\n', m );
  fprintf ( 1, '  The number of sample points is N = %d\n', n );

  seed = 123456789;
  [ x, seed ] = r8mat_uniform_01 ( m, n, seed );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', prob );

    [ c, seed ] = p00_c ( prob, m, seed );
    r8vec_print ( m, c, '  C parameters:' );

    [ w, seed ] = p00_w ( prob, m, seed );
    r8vec_print ( m, w, '  W parameters:' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '      Exact Integral     Q\n' );
    fprintf ( 1, '\n' );

    q1 = p00_q ( prob, m, c, w );

    f = p00_f ( prob, m, c, w, n, x );
    q2 = sum ( f(1:n) ) / n;

    fprintf ( 1, '  %14g  %14g\n', q1, q2 );

  end

  return
end

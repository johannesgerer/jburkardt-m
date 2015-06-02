function sphere_random_centralize_test ( )

%*****************************************************************************80
%
%% SPHERE_RANDOM_CENTRALIZE_TEST tests SPHERE_RANDOM_CENTRALIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_RANDOM_CENTRALIZE_TEST\n' );
  fprintf ( 1, '  Estimate sphere parameters from random samples.\n' );
  fprintf ( 1, '  The spatial dimension is M.\n' );
  fprintf ( 1, '  The number of sample points is N.\n' );
  fprintf ( 1, '  The center is at the origin.\n' );
  fprintf ( 1, '  The radius is 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Perhaps surprisingly, for a fixed R, the error behavior\n' );
  fprintf ( 1, '  seems roughly the same in all dimensions!\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   M       N         C error         R error\n' );
  fprintf ( 1, '\n' );
  m = 2;
  for m_log = 1 : 7
    fprintf ( 1, '\n' );
    n = 1;
    for n_log = 1 : 6
      c = zeros ( m, 1 );
      r = 1;
      [ c_est, r_est, c_err, r_err ] = sphere_random_centralize ( m, n, c, r );
      fprintf ( 1, '  %2d  %6d  %14.6g  %14.6g\n', m, n, c_err, r_err );
      n = n * 2;
    end
    m = m * 2;
  end

  return
end


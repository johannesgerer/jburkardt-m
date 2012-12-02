function quality_test11 ( dim_num, n, z )

%*****************************************************************************80
%
%% TEST11 tests POINTSET_SPACING.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n');
  fprintf ( 1, 'TEST11\n');
  fprintf ( 1, '  POINTSET_SPACING computes pointset spacing parameters.\n');

  gamma = pointset_spacing ( dim_num, n, z );

  gamma_min = min ( gamma(1:n) );
  gamma_max = max ( gamma(1:n) );

  gamma_ave = sum ( gamma(1:n) ) / n;

  if ( 1 < n )
    gamma_std = sqrt ( sum ( ( gamma(1:n) - gamma_ave ).^2 )  / ( n - 1 ) );
  else
    gamma_std = 0.0;
  end

  fprintf ( 1, '\n');
  fprintf ( 1, '  Minimum spacing          GAMMA_MIN = %f\n', gamma_min );
  fprintf ( 1, '  Average spacing          GAMMA_AVE = %f\n', gamma_ave );
  fprintf ( 1, '  Maximum spacing          GAMMA_MAX = %f\n', gamma_max );
  fprintf ( 1, '  Spacing standard dev     GAMMA_STD = %f\n', gamma_std );

  return
end

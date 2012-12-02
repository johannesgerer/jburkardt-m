function combo_test12 ( )

%*****************************************************************************80
%
%% COMBO_TEST12 tests KNAPSACK_REORDER and KNAPSACK_RATIONAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  mass_limit = 26.0;
  p = [ 24.0, 13.0, 23.0, 15.0, 16.0 ]';
  w = [ 12.0,  7.0, 11.0,  8.0,  9.0 ]';

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST12\n' );
  fprintf ( 1, '  KNAPSACK_REORDER reorders the knapsack data.\n' );
  fprintf ( 1, '  KNAPSACK_RATIONAL solves the rational knapsack problem.\n' );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Object, Profit, Mass, "Profit Density"\n' );
  fprintf ( 1, ' \n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %7.3f  %7.3f  %7.3f\n', i, p(i), w(i), p(i) / w(i) );
  end

  [ p, w ] = knapsack_reorder ( n, p, w );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  After reordering by Profit Density:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Object, Profit, Mass, "Profit Density"\n' );
  fprintf ( 1, ' \n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %7.3f  %7.3f  %7.3f\n', i, p(i), w(i), p(i) / w(i) );
  end

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Total mass restriction is %f\n', mass_limit );

  [ x, mass, profit ] = knapsack_rational ( n, mass_limit, p, w  );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Object, Density, Choice, Profit, Mass\n' );
  fprintf ( 1, ' \n' );
  for i = 1 : n
    fprintf ( 1, '%6d  %7.3f  %7.3f  %7.3f  %7.3f\n', ...
      i, p(i) / w(i), x(i),  x(i) * p(i), x(i) * w(i) );
  end

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Total:                  %7.3f  %7.3f\n', profit, mass );

  return
end

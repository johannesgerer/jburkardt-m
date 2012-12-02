function subpak_test29 ( )

%*****************************************************************************80
%
%% TEST29 tests RAT_FACTOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  factor_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST29\n' );
  fprintf ( 1, '  RAT_FACTOR factors a rational value.\n' );

  m = 13 * 7 * 9 * 2;
  n = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rational value is %d / %d\n', m, n );

  [ factor_num, factor, power, mleft, nleft ] = rat_factor ( m, n, factor_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Prime representation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, FACTOR(I), POWER(I)\n' );
  fprintf ( 1, '\n' );

  if ( mleft ~= 1 | nleft ~= 1 )
    fprintf ( 1, '  %8d  %8d / %8d (Unfactored portion)\n', 0, mleft, nleft );
  end

  for i = 1 : factor_num
    fprintf ( 1, '  %8d  %8d  %8d\n', i, factor(i), power(i) );
  end

  return
end

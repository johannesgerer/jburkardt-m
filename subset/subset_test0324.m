function subset_test0324 ( )

%*****************************************************************************80
%
%% TEST0324 tests I4_FACTOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0324\n' );
  fprintf ( 1, '  I4_FACTOR factors an integer.\n' );

  n = 2 * 2 * 17 * 37;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integer is %d\n', n );

  [ nfactor, factor, power, nleft ] = i4_factor ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Prime representation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, FACTOR(I), POWER(I)\n' );
  fprintf ( 1, '\n' );
  if ( abs ( nleft ) ~= 1 )
    fprintf ( 1, '  %6d  %6d  (UNFACTORED PORTION)\n', 0, nleft );
  end

  for i = 1 : nfactor
    fprintf ( 1, '  %6d  %6d  %6d\n', i, factor(i), power(i) );
  end
 
  return
end

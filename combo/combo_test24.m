function combo_test24 ( )

%*****************************************************************************80
%
%% COMBO_TEST24 tests PART_SF_MAJORIZE.
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
  n = 8;

  a = [ 2, 2, 2, 1, 1, 0, 0, 0 ]';
  b = [ 3, 1, 1, 1, 1, 1, 0, 0 ]';
  c = [ 2, 2, 1, 1, 1, 1, 0, 0 ]';
  nparta = 5;
  npartb = 6;
  npartc = 6;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST24\n' );
  fprintf ( 1, '  PART_SF_MAJORIZE determines if one partition\n' );
  fprintf ( 1, '  majorizes another.\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Partitions of N = %d\n', n );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  A: ' );
  for i = 1 : nparta
    fprintf ( 1, '%3d', a(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  B: ' );
  for i = 1 : npartb
    fprintf ( 1, '%3d', b(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C: ' );
  for i = 1 : npartc
    fprintf ( 1, '%3d', c(i) );
  end
  fprintf ( 1, '\n' );

  result = part_sf_majorize ( n, nparta, a, npartb, b );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  A compare B: %d\n', result );
  result = part_sf_majorize ( n, npartb, b, npartc, c );
  fprintf ( 1, '  B compare C: %d\n', result );
  result = part_sf_majorize ( n, npartc, c, nparta, a );
  fprintf ( 1, '  C compare A: %d\n', result );
  result = part_sf_majorize ( n, npartc, c, npartc, c );
  fprintf ( 1, '  C compare C: %d\n', result );

  return
end

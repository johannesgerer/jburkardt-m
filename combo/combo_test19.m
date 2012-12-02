function combo_test19 ( )

%*****************************************************************************80
%
%% COMBO_TEST19 tests NPART_RSF_LEX_RANDOM;
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
  npart = 3;
  n = 12;
  seed = 123456789;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST19\n' );
  fprintf ( 1, '  Partitions of N = %d\n', n );
  fprintf ( 1, '  with NPART = %d parts\n', npart );
  fprintf ( 1, '  in reverse standard form:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  NPART_RSF_LEX_RANDOM produces random examples.\n' );
  fprintf ( 1, ' \n' );

  for i = 1 : 10

    [ t, seed ] = npart_rsf_lex_random ( n, npart, seed );

    fprintf ( 1, '  ' );
    for i = 1 : npart
      fprintf ( 1, '%5d', t(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end

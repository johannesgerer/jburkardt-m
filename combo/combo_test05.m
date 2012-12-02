function combo_test05 ( )

%*****************************************************************************80
%
%% COMBO_TEST05 tests CYCLE_TO_PERM, PERM_TO_CYCLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST05\n' );
  fprintf ( 1, '  CYCLE_TO_PERM converts a permutation from\n' );
  fprintf ( 1, '  cycle to array form;\n' );
  fprintf ( 1, '  PERM_TO_CYCLE converts a permutation from\n' );
  fprintf ( 1, '  array to cycle form.\n' );
%
%  Enumerate.
%
  nperm = perm_enum ( n );
%
%  Choose a "random" permutation.
%
  rank = floor ( nperm / 2 );

  p = perm_lex_unrank ( rank, n );

  perm_print ( n, p, '  "Random" permutation:' );
%
%  Convert the permutation to cycle form.
%
  [ ncycle, t, index ] = perm_to_cycle ( n, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Corresponding cycle form:\n' );
  fprintf ( 1, '  Number of cycles is %d\n', ncycle );
  fprintf ( 1, '\n' );
  jlo = 0;
  for i = 1 : ncycle
    fprintf ( 1, '    ' );
    for j = jlo+1 : jlo+index(i)
      fprintf ( 1, '%4d', t(j) );
    end
    fprintf ( 1, '\n' );
    jlo = jlo + index(i);
  end
%
%  Convert the set partition back to an RGF.
%
  p = cycle_to_perm ( n, ncycle, t, index );

  perm_print ( n, p, '  Corresponding permutation:' );

  return
end

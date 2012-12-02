function combo_test02 ( )

%*****************************************************************************80
%
%% COMBO_TEST02 tests BAL_SEQ_TO_TABLEAU, TABLEAU_TO_BAL_SEQ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST02\n' );
  fprintf ( 1, '  BAL_SEQ_TO_TABLEAU converts a balanced\n' );
  fprintf ( 1, '  sequence to a tableau;\n' );
  fprintf ( 1, '  TABLEAU_TO_BAL_SEQ converts a tableau\n' );
  fprintf ( 1, '  to a balanced sequence.\n' );
%
%  Pick a "random" balanced sequence.
%
  rank = 7;

  t = bal_seq_unrank ( rank, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Random" balanced sequence:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : 2 * n
    fprintf ( 1, '%2d', t(i) );
  end
  fprintf ( 1, '\n' );
%
%  Convert to a tableau.
%
  tab = bal_seq_to_tableau ( n, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Corresponding tableau\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : n
    fprintf ( 1, '%2d', tab(1,i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : n
    fprintf ( 1, '%2d', tab(2,i) );
  end
  fprintf ( 1, '\n' );
%
%  Convert to a balanced sequence.
%
  t = tableau_to_bal_seq ( n, tab );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Balance sequence recovered from tableau:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : 2 * n
    fprintf ( 1, '%2d', t(i) );
  end
  fprintf ( 1, '\n' );

  return
end

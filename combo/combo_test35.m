function combo_test35 ( )

%*****************************************************************************80
%
%% COMBO_TEST35 tests RGF_TO_SETPART and SETPART_TO_RGF.
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
  m = 8;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST35\n' );
  fprintf ( 1, '  RGF_TO_SETPART converts a balanced\n' );
  fprintf ( 1, '  sequence to a restricted growth function;\n' );
  fprintf ( 1, '  SETPART_TO_RGF converts a restricted growth\n' );
  fprintf ( 1, '  function to a balanced sequence.\n' );
%
%  Choose a "random" RGF.
%
  rank = 7;
  f = rgf_unrank ( rank, m );

  i4vec_print ( m, f,  '  "Random" restricted growth function:' );
%
%  Convert the RGF to a set partition.
%
  [ nsub, s, index ] = rgf_to_setpart ( m, f );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Corresponding set partition\n' );
  fprintf ( 1, ' \n' );
  jlo = 1;
  for i = 1 : nsub
    for j = jlo : index(i)
      fprintf ( 1, '%4d', s(j) );
    end
    fprintf ( 1, '\n');
    jlo = index(i) + 1;
  end
%
%  Convert the set partition back to an RGF.
%
  f = setpart_to_rgf ( m, nsub, s, index );

  i4vec_print ( m, f,  '  Recovered restricted growth function:' );

  return
end

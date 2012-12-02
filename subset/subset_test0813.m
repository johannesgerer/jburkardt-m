function subset_test0813 ( )

%*****************************************************************************80
%
%% TEST0813 tests MULTIPERM_ENUM.
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
  n = 5;

  seed = 123456789;
  test_num = 5;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0813\n' );
  fprintf ( 1, '  MULTIPERM_ENUM enumerates multipermutations.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N is the number of objects to be permuted.\n' );
  fprintf ( 1, '  K is the number of distinct types of objects.\n' );
  fprintf ( 1, '  COUNTS is the number of objects of each type.\n' );
  fprintf ( 1, '  NUMBER is the number of multipermutations.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number       N       K       Counts(1:K)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ k, seed ] = i4_uniform ( 1, n, seed );

    [ counts, seed ] = compnz_random ( n, k, seed );

    number = multiperm_enum ( n, k, counts );

    fprintf ( 1, '  %6d  %6d  %6d', number, n, k );
    for i = 1 : k
      fprintf ( 1, '  %4d', counts(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end

function subset_test021 ( )

%*****************************************************************************80
%
%% TEST021 tests DEBRUIJN.
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
  num_test = 3;
  mtest = [ 2, 3, 2 ];
  ntest = [ 3, 3, 4 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST021\n' );
  fprintf ( 1, '  DEBRUIJN computes a de Bruijn string.\n' );

  for itest = 1 : num_test

    m = mtest(itest);
    n = ntest(itest);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The alphabet size is M = %d\n', m );
    fprintf ( 1, '  The string length is N = %d\n', n );

    string = debruijn ( m, n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    ' );
    for i = 1 : m^n
      fprintf ( 1, '%d', string(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

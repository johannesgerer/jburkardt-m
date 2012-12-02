function subset_test103 ( )

%*****************************************************************************80
%
%% TEST103 tests PERM_RANDOM2;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST103\n' );
  fprintf ( 1, '  PERM_RANDOM2 produces a random permutation of labels;\n' );
  fprintf ( 1, '\n' );

  n = 4;
  seed = 123456789;

  for i = 1 : 5
    p(1:n) = [ 101, 202, 303, 404 ];
    [ p, seed ] = perm_random2 ( n, p, seed );
    perm_print ( n, p, ' ' );
  end

  return
end

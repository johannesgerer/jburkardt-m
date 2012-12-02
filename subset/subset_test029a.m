function subset_test029a ( )

%*****************************************************************************80
%
%% TEST029a tests EQUIV_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST029a\n' );
  fprintf ( 1, '  EQUIV_RANDOM selects a random set partition.\n' );
 
  seed = 123456789;

  for i = 1 : 5
 
    [ npart, a, b, seed ] = equiv_random ( n, seed );

    equiv_print ( n, a, '  The partition:' );
 
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now repeat, but print using EQUIV_PRINT2.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5
 
    [ npart, a, b, seed ] = equiv_random ( n, seed );

    equiv_print2 ( n, a, '  The partition:' );
 
  end

  return
end

function subset_test057 ( )

%*****************************************************************************80
%
%% TEST057 tests INS_PERM, PERM_INS.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST057\n' );
  fprintf ( 1, '  PERM_INS computes the inversion sequence.\n' );
  fprintf ( 1, '  INS_PERM recovers the permutation.\n' );
  fprintf ( 1, '\n' );

  perm(1:n) = [ 3, 5, 1, 4, 2 ];

  ins = perm_ins ( n, perm );

  perm2 = ins_perm ( n, ins );

  for i = 1 : n
    fprintf ( 1, '  %3d', i );
  end
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d', perm(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d', ins(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d', perm2(i) );
  end
  fprintf ( 1, '\n' );
 
  return
end

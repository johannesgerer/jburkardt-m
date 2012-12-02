function pack_rules_test ( )

%*****************************************************************************80
%
%% PACK_RULES_TEST tests RULES_1D_SIZE and RULES_1D_SET.
%
%  Discussion:
%
%    These two procedures create packed arrays of information defining
%    the 1D rules needed for the sparse grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2012
%
%  Author:
%
%    John Burkardt.
%
  k = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PACK_RULES_TEST\n' );
  fprintf ( 1, '  Given a sparse grid level K, the code must collect\n' );
  fprintf ( 1, '  the nodes and weights for the 1D rule of levels 1 through K.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  RULES_1D_SIZE determines the size of the packed vectors.\n' );
  fprintf ( 1, '  RULES_1D_SET creates the packed vectors.\n' );

  sym = 1;

  [ r1d_size, r1d ] = rules_1d_size ( k, sym, @ccu_order );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1D_SIZE = %d\n', r1d_size );

  i4vec_print ( k + 1, r1d, '  R1D pointer vector:' );
%
%  Now call CCU2 to set values...
%  We have to call a version of CCU2 that takes the ORDER as input, not the level.
%
  [ x1d, w1d ] = rules_1d_set ( k, sym, @ccu_order, @ccu2, r1d_size, r1d );

  r8vecs_print ( k, r1d, r1d_size, x1d, '  X vectors' );
  r8vecs_print ( k, r1d, r1d_size, w1d, '  W vectors' );

  return
end

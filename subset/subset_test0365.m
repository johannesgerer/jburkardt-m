function subset_test0365 ( )

%*****************************************************************************80
%
%% TEST0365 tests IBSET.
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
  i = 101;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0365\n' );
  fprintf ( 1, '  IBSET sets a bit to 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           I Bit  IBSET(I,BIT)\n' );
  fprintf ( 1, '\n' );

  for bit = 0 : 31

    j = ibset ( i, bit );

    fprintf ( 1, '  %12d  %2d  %12d\n', i, bit, j );

  end

  return
end

function subset_test115 ( )

%*****************************************************************************80
%
%% TEST115 tests R8_AGM
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
  fprintf ( 1, 'TEST115\n' );
  fprintf ( 1, '  R8_AGM computes the arithmetic-geometric mean (AGM)\n' );
  fprintf ( 1, '  of two nonnegative real numbers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    X        Y    R8_AGM(X,Y)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 10
    [ x, seed ] = i4_uniform ( 1, 10, seed );
    [ y, seed ] = i4_uniform ( 1, 10, seed );
    z = r8_agm ( x, y );
    fprintf ( 1, '  %8f  %8f  %8f\n', x, y, z );
  end

  return
end

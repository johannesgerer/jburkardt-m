function i4_to_pascal_test ( )

%*****************************************************************************80
%
%% I4_TO_PASCAL_TEST tests I4_TO_PASCAL.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/i4_to_pascal_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_TO_PASCAL_TEST\n' );
  fprintf ( 1, '  I4_TO_PASCAL converts a linear index to\n' );
  fprintf ( 1, '  Pascal triangle indices.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     K  =>   I     J\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 20

    [ i, j ] = i4_to_pascal ( k );

    fprintf ( 1, '  %4d    %4d  %4d\n', k, i, j );

  end

  return
end

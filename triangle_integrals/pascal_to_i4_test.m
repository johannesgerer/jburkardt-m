function pascal_to_i4_test ( )

%*****************************************************************************80
%
%% PASCAL_TO_I4_TEST tests PASCAL_TO_I4.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/pascal_to_i4.m
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
  fprintf ( 1, 'PASCAL_TO_I4_TEST\n' );
  fprintf ( 1, '  PASCAL_TO_I4 converts Pascal triangle indices to a\n' );
  fprintf ( 1, '  linear index.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J =>    K\n' );
  fprintf ( 1, '\n' );

  for d = 0 : 4
    for i = d : -1 : 0
      j = d - i;
      k = pascal_to_i4 ( i, j );
      fprintf ( 1, '  %4d  %4d    %4d\n', i, j, k );
    end
    fprintf ( 1, '\n' );
  end

  return
end

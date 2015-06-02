function bvec_next_grlex_test ( )

%*****************************************************************************80
%
%% BVEC_NEXT_GRLEX_TEST tests BVEC_NEXT_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 March 2015
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_NEXT_GRLEX_TEST\n' );
  fprintf ( 1, '  BVEC_NEXT_GRLEX computes binary vectors in GRLEX order.\n' );
  fprintf ( 1, '\n' );

  b = zeros ( n, 1 );

  for i = 0 : 16
    fprintf ( 1, '  %2d:  ', i );
    for j = 1 : n
      fprintf ( 1, '%d', b(j) );
    end
    fprintf ( 1, '\n' );
    b = bvec_next_grlex ( n, b );
  end

  return
end

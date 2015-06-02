function bvec_next_test ( )

%*****************************************************************************80
%
%% BVEC_NEXT_TEST tests BVEC_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 January 2014
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_NEXT_TEST\n' );
  fprintf ( 1, '  BVEC_NEXT computes the "next" BVEC.\n' );
  fprintf ( 1, '\n' );

  b = zeros ( n, 1 );

  for i = 0 : 16
    bvec_print ( n, b, '' );
    b = bvec_next ( n, b );
  end

  return
end

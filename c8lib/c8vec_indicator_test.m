function c8vec_indicator_test ( )

%*****************************************************************************80
%
%% C8VEC_INDICATOR_TEST tests C8VEC_INDICATOR;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8VEC_INDICATOR_TEST\n' );
  fprintf ( 1, '  C8VEC_INDICATOR sets A = (1-1i,2-2i,...,N-Ni)\n' );

  a = c8vec_indicator ( n );
 
  c8vec_print ( n, a, '  The "indicator" vector:' );

  return
end

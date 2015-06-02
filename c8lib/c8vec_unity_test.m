function c8vec_unity_test ( )

%*****************************************************************************80
%
%% C8VEC_UNITY_TEST tests C8VEC_UNITY;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2015
%
%  Author:
%
%    John Burkardt
%
  n = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8VEC_UNITY_TEST\n' );
  fprintf ( 1, '  C8VEC_UNITY sets A to the N roots of unity\n' );

  a = c8vec_unity ( n );
 
  c8vec_print ( n, a, '  The N roots of unity:' );

  return
end

function r8vec_concatenate_test ( )

%*****************************************************************************80
%
%% R8VEC_CONCATENATE_TEST tests R8VEC_CONCATENATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2014
%
%  Author:
%
%    John Burkardt
%
  n1 = 5;
  n2 = 3;
  n3 = n1 + n2;

  a1 = [ 91.1, 31.2, 71.3, 51.4, 31.5 ];
  a2 = [ 42.6, 22.7, 12.8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_CONCATENATE_TEST\n' );
  fprintf ( 1, '  R8VEC_CONCATENATE concatenates two R8VECs\n' );

  r8vec_print ( n1, a1, '  Array 1:' );
  r8vec_print ( n2, a2, '  Array 2:' );
  a3 = r8vec_concatenate ( n1, a1, n2, a2 );
  r8vec_print ( n3, a3, '  Array 3 = Array 1 + Array 2:' );

  return
end

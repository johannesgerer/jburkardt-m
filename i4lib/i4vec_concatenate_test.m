function i4vec_concatenate_test ( )

%*****************************************************************************80
%
%% I4VEC_CONCATENATE_TEST tests I4VEC_CONCATENATE.
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

  a1 = [ 91, 31, 71, 51, 31 ];
  a2 = [ 42, 22, 12 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_CONCATENATE_TEST\n' );
  fprintf ( 1, '  I4VEC_CONCATENATE concatenates two I4VECs\n' );

  i4vec_print ( n1, a1, '  Array 1:' );
  i4vec_print ( n2, a2, '  Array 2:' );
  a3 = i4vec_concatenate ( n1, a1, n2, a2 );;
  i4vec_print ( n3, a3, '  Array 3 = Array 1 + Array 2:' );

  return
end

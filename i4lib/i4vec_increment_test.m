function i4vec_increment_test ( )

%*****************************************************************************80
%
%% I4VEC_INCREMENT_TEST tests I4VEC_INCREMENT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2015
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_INCREMENT_TEST\n' );
  fprintf ( 1, '  I4VEC_INCREMENT increments an I4VEC.\n' );

  v_lo = -5;
  v_hi = 10;
  seed = 123456789;
  [ v, seed ] = i4vec_uniform_ab ( n, v_lo, v_hi, seed );
  i4vec_print ( n, v, '  The I4VEC:' );
  v = i4vec_increment ( n, v );
  i4vec_print ( n, v, '  The I4VEC after incrementing:' );

  return
end

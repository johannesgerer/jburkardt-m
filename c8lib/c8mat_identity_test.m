function c8mat_identity_test ( )

%*****************************************************************************80
%
%% C8MAT_IDENTITY_TEST tests C8MAT_IDENTITY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2015
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8MAT_IDENTITY_TEST\n' );
  fprintf ( 1, '  C8MAT_IDENTITY returns the complex identity matrix.\n' );

  a = c8mat_identity ( n );

  c8mat_print ( m, n, a, '  The identity matrix:' );

  return
end

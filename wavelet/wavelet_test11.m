function wavelet_test11 ( )

%*****************************************************************************80
%
%% WAVELET_TEST11 tests DAUB*_MATRIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WAVELET_TEST11\n' );
  fprintf ( 1, '  DAUB*_MATRIX computes the DAUB* matrix.\n' );
  fprintf ( 1, '  Verify that each matrix is orthogonal.\n' );
  fprintf ( 1, '\n' );

  n = 20;

  a = daub2_matrix ( n );
  c = a * a';
  error_frobenius = r8mat_is_identity ( n, c );

  fprintf ( 1, '  DAUB2,   N = %4d  || A*A'' - I|| = %g\n', n, error_frobenius );

  a = daub4_matrix ( n );
  c = a * a';
  error_frobenius = r8mat_is_identity ( n, c );

  fprintf ( 1, '  DAUB4,   N = %4d  || A*A'' - I|| = %g\n', n, error_frobenius );

  a = daub6_matrix ( n );
  c = a * a';
  error_frobenius = r8mat_is_identity ( n, c );

  fprintf ( 1, '  DAUB6,   N = %4d  || A*A'' - I|| = %g\n', n, error_frobenius );

  a = daub8_matrix ( n );
  c = a * a';
  error_frobenius = r8mat_is_identity ( n, c );

  fprintf ( 1, '  DAUB8,   N = %4d  || A*A'' - I|| = %g\n', n, error_frobenius );

  a = daub10_matrix ( n );
  c = a * a';
  error_frobenius = r8mat_is_identity ( n, c );

  fprintf ( 1, '  DAUB10,  N = %4d  || A*A'' - I|| = %g\n', n, error_frobenius );

  a = daub12_matrix ( n );
  c = a * a';
  error_frobenius = r8mat_is_identity ( n, c );

  fprintf ( 1, '  DAUB12,  N = %4d  || A*A'' - I|| = %g\n', n, error_frobenius );

  return
end

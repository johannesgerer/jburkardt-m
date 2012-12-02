function msm_to_mm_test12 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST12 tests MSM_TO_MM_COORDINATE_COMPLEX_HERMITIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_MM_TEST12\n' );
  fprintf ( 1, '  Convert an MSM to MM coordinate complex hermitian format.\n' );

  output_filename = 'msm_to_mm_test12.mm';
  a = c8mat_indicator ( 3, 3 );
  a = 0.5 * ( a + a' );
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'coordinate', 'complex', 'hermitian' );

  return
end

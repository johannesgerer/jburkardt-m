function msm_to_mm_test02 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST02 tests MSM_TO_MM_ARRAY_COMPLEX_HERMITIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_MM_TEST02\n' );
  fprintf ( 1, '  Convert an MSM to MM array complex hermitian format.\n' );

  output_filename = 'msm_to_mm_test02.mm';
  a = c8mat_indicator ( 3, 3 );
  a = 0.5 * ( a + a' );
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'array', 'complex', 'hermitian' );

  return
end

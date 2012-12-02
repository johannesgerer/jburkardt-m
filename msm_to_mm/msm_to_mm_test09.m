function msm_to_mm_test09 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST09 tests MSM_TO_MM_ARRAY_REAL_SKEW_SYMMETRIC.
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
  fprintf ( 1, 'MSM_TO_MM_TEST09\n' );
  fprintf ( 1, '  Convert an MSM to MM array real skew-symmetric format.\n' );

  output_filename = 'msm_to_mm_test09.mm';

  a = r8mat_indicator ( 4, 4 );
  a = a - a';
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'array', 'real', 'skew-symmetric' );

  return
end

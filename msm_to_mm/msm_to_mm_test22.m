function msm_to_mm_test22 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST22 tests MSM_TO_MM_COORDINATE_PATTERN_SYMMETRIC.
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
  fprintf ( 1, 'MSM_TO_MM_TEST22\n' );
  fprintf ( 1, '  Convert an MSM to MM coordinate pattern symmetric format.\n' );

  output_filename = 'msm_to_mm_test22.mm';

  a = i4mat_indicator ( 4, 4 );
  a = a + a';
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'coordinate', 'pattern', 'symmetric' );

  return
end

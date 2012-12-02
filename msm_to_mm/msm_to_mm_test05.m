function msm_to_mm_test05 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST05 tests MSM_TO_MM_ARRAY_INTEGER_GENERAL.
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
  fprintf ( 1, 'MSM_TO_MM_TEST05\n' );
  fprintf ( 1, '  Convert an MSM to MM array integer general format.\n' );

  output_filename = 'msm_to_mm_test05.mm';

  a = i4mat_indicator ( 5, 3 );
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'array', 'integer', 'general' );

  return
end

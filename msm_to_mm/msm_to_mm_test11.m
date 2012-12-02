function msm_to_mm_test11 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST11 tests MSM_TO_MM_COORDINATE_COMPLEX_GENERAL.
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
  fprintf ( 1, 'MSM_TO_MM_TEST11\n' );
  fprintf ( 1, '  Convert an MSM to MM coordinate complex general format.\n' );

  output_filename = 'msm_to_mm_test11.mm';
  a = c8mat_indicator ( 5, 3 );
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'coordinate', 'complex', 'general' );

  return
end

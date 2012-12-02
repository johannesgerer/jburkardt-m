function msm_to_mm_test13 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST13 tests MSM_TO_MM_COORDINATE_COMPLEX_SKEWSYMMETRIC.
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
  fprintf ( 1, 'MSM_TO_MM_TEST13\n' );
  fprintf ( 1, '  Convert an MSM to MM coordinate complex skew-symmetric format.\n' );

  output_filename = 'msm_to_mm_test13.mm';
  a = c8mat_indicator ( 4, 4 );
  for j = 1 : 4
    a(j,j) = 0.0;
    for i = j + 1 : 4
      a(i,j) = - a(j,i);
    end
  end
%
%  Have MSM_TO_MM write the matrix to a file.
%
  msm_to_mm ( output_filename, a, 'coordinate', 'complex', 'skew-symmetric' );

  return
end

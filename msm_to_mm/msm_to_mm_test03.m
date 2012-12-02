function msm_to_mm_test03 ( )

%*****************************************************************************80
%
%% MSM_TO_MM_TEST03 tests MSM_TO_MM_ARRAY_COMPLEX_SKEWSYMMETRIC.
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
  fprintf ( 1, 'MSM_TO_MM_TEST03\n' );
  fprintf ( 1, '  Convert an MSM to MM array complex skew-symmetric format.\n' );

  output_filename = 'msm_to_mm_test03.mm';
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
  msm_to_mm ( output_filename, a, 'array', 'complex', 'skew-symmetric' );

  return
end

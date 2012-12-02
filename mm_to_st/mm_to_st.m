function mm_to_st ( input_filename, output_filename )

%*****************************************************************************80
%
%% MSM_TO_ST converts sparse matrix information from MM to ST format.
%
%  Discussion:
%
%    MM format is the "Matrix Market" format.
%    ST format is the "Sparse Triplet" format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the MM file.
%
%    Input, string OUTPUT_FILENAME, the name of the ST file.
%
  [ a, rows, cols, entries, rep, field, symm ] = mm_to_msm ( input_filename );

  msm_to_st ( a, output_filename );

  return
end

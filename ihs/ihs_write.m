function ihs_write ( m, n, d, seed_init, seed, r, file_out_name )

%*****************************************************************************80
%
%% IHS_WRITE writes an IHS dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the M-dimensional
%    components of the next entry in the dataset.
%
%    Note that the actual values of the data are integers between 1
%    and N.  For our convenience, these are rescaled by the
%    mapping
%
%      I -> ( 2 * I - 1 )/ ( 2 * N ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of elements in the subsequence.
%
%    Input, integer D, the duplication factor.
%
%    Input, integer SEED_INIT, the initial seed for the random number generator.
%
%    Input, integer SEED, the current seed for the random number generator.
%
%    Input, real R(M,N), the points.
%
%    Input, string FILE_OUT_NAME, the name of the output file.
%
  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'IHS_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'IHS_WRITE - Fatal error!' );
  end

  fprintf ( file_out_unit, '#  %s\n', file_out_name );
  fprintf ( file_out_unit, '#  created by IHS_WRITE.M\n' );
  fprintf ( file_out_unit, '#\n' );
  fprintf ( file_out_unit, '#  Spatial dimension M =     %d\n', m );
  fprintf ( file_out_unit, '#  Number of points N =      %d\n', n );
  fprintf ( file_out_unit, '#  EPSILON (unit roundoff ) = %e\n', ...
    r8_epsilon ( 'DUMMY' ) );
  fprintf ( file_out_unit, '#  Duplication factor D =    %d\n', d );
  fprintf ( file_out_unit, '#  Initial SEED_INIT =       %d\n', seed_init );
  fprintf ( file_out_unit, '#  Current SEED      =       %d\n', seed );
  fprintf ( file_out_unit, '#\n' );

  for j = 1 : n
    for i = 1 : m
      fprintf ( file_out_unit, '  %10f', ( 2 * r(i,j) - 1 ) / ( 2 * n ) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end

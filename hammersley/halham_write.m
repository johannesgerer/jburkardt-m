function halham_write ( dim_num, n, step, seed, leap, base, r, file_out_name )

%*****************************************************************************80
%
%% HALHAM_WRITE writes a Halton or Hammersley dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the DIM_NUM-dimensional
%    components of the next entry in the dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of elements in the subsequence.
%
%    Input, integer STEP, the index of the subsequence element.
%    0 <= STEP is required.
%
%    Input, integer SEED(DIM_NUM), the sequence index corresponding
%    to STEP = 0.
%
%    Input, integer LEAP(DIM_NUM), the successive jumps in the sequence.
%
%    Input, integer BASE(DIM_NUM), the bases.
%
%    Input, real R(DIM_NUM,N), the points.
%
%    Input, string FILE_OUT_NAME, the name of
%    the output file.
%
  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALHAM_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'HALHAM_WRITE - Fatal error!' );
  end

  fprintf ( file_out_unit, '#  %s\n', file_out_name );
  fprintf ( file_out_unit, '#  created by HALHAM_WRITE.M\n' );
  fprintf ( file_out_unit, '#\n' );
  fprintf ( file_out_unit, '#  DIM_NUM = %d\n', dim_num );
  fprintf ( file_out_unit, '#  N =    %d\n', n );
  fprintf ( file_out_unit, '#  STEP = %d\n', step );

  for mlo = 1 : 5 : dim_num
    mhi = min ( mlo + 5 - 1, dim_num );
    if ( mlo == 1 )
      fprintf ( file_out_unit, '#  SEED = ' );
    else
      fprintf ( file_out_unit, '#         ' );
    end
    for i = mlo : mhi
      fprintf ( file_out_unit, '  %12d', seed(i) );
    end
    fprintf ( file_out_unit, '\n' );
  end
  for mlo = 1 : 5 : dim_num
    mhi = min ( mlo + 5 - 1, dim_num );
    if ( mlo == 1 )
      fprintf ( file_out_unit, '#  LEAP = ' );
    else
      fprintf ( file_out_unit, '#         ' );
    end
    for i = mlo : mhi
      fprintf ( file_out_unit, '  %12d', leap(i) );
    end
    fprintf ( file_out_unit, '\n' );
  end
  for mlo = 1 : 5 : dim_num
    mhi = min ( mlo + 5 - 1, dim_num );
    if ( mlo == 1 )
      fprintf ( file_out_unit, '#  BASE = ' );
    else
      fprintf ( file_out_unit, '#         ' );
    end
    for i = mlo : mhi
      fprintf ( file_out_unit, '  %12d', base(i) );
    end
    fprintf ( file_out_unit, '\n' );
  end
  fprintf ( file_out_unit, '#\n' );

  for j = 1 : n
    for i = 1 : dim_num
      fprintf ( file_out_unit, '  %10f', r(i,j) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end

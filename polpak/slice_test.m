function slice_test ( )

%*****************************************************************************80
%
%% SLICE_TEST tests SLICE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
  dim_max = 5;
  slice_max = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SLICE_TEST:\n' );
  fprintf ( 1, '  SLICE determines the maximum number of pieces created\n' );
  fprintf ( 1, '  by SLICE_NUM slices in a DIM_NUM space.\n' );

  for dim_num = 1 : dim_max
    for slice_num = 1 : slice_max
      piece_num = slice ( dim_num, slice_num );
      p(dim_num,slice_num) = piece_num;
    end
  end

  i4mat_print ( dim_max, slice_max, p, '  Slice Array:' );

  return
end

function p_data = p00_data ( prob, dim_num, data_num )

%*****************************************************************************80
%
%% P00_DATA returns the data for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer DIM_NUM, the spatial dimension of the dependent
%    variables.
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Output, real P_DATA(DIM_NUM,DATA_NUM), the data.
%
  if ( prob == 1 )
    p_data = p01_data ( dim_num, data_num );
  elseif ( prob == 2 )
    p_data = p02_data ( dim_num, data_num );
  elseif ( prob == 3 )
    p_data = p03_data ( dim_num, data_num );
  elseif ( prob == 4 )
    p_data = p04_data ( dim_num, data_num );
  elseif ( prob == 5 )
    p_data = p05_data ( dim_num, data_num );
  elseif ( prob == 6 )
    p_data = p06_data ( dim_num, data_num );
  elseif ( prob == 7 )
    p_data = p07_data ( dim_num, data_num );
  elseif ( prob == 8 )
    p_data = p08_data ( dim_num, data_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DATA - Fatal error!\n' );
    fprintf ( 1, '  Unexpected input value of PROB.\n' );
    error ( 'P00_DATA - Fatal error!' );
  end

  return
end

function data_num = p00_data_num ( prob )

%*****************************************************************************80
%
%% P00_DATA_NUM returns the number of data points for any problem.
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
%    Output, integer DATA_NUM, the number of data points.
%
  if ( prob == 1 )
    data_num = p01_data_num ( );
  elseif ( prob == 2 )
    data_num = p02_data_num ( );
  elseif ( prob == 3 )
    data_num = p03_data_num ( );
  elseif ( prob == 4 )
    data_num = p04_data_num ( );
  elseif ( prob == 5 )
    data_num = p05_data_num ( );
  elseif ( prob == 6 )
    data_num = p06_data_num ( );
  elseif ( prob == 7 )
    data_num = p07_data_num ( );
  elseif ( prob == 8 )
    data_num = p08_data_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DATA_NUM - Fatal error!\n' );
    fprintf ( 1, '  Unexpected input value of PROB.\n' );
    error ( 'P00_DATA_NUM - Fatal error!' );
  end

  return
end

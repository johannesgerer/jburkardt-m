function data_num = p00_data_num ( prob )

%*****************************************************************************80
%
%% P00_DATA_NUM returns the dimension of the data vector for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the index of the problem.
%
%    Output, integer DATA_NUM, the dimension of the data vector.
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
  elseif ( prob == 9 )
    data_num = p09_data_num ( );
  elseif ( prob == 10 )
    data_num = p10_data_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DATA_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = 5d\n', prob );
    error ( 'P00_DATA_NUM - Fatal error!' );
  end

  return
end

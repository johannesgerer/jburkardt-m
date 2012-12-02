function [ x, y ] = p00_dat ( prob, data_num )

%*****************************************************************************80
%
%% P00_DAT returns the data vector for any problem.
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
%    Input, integer PROB, the number of the desired test problem.
%
%    Input, integer DATA_NUM, the number of data points.
%
%    Output, real X(DATA_NUM), the abscissa data.
%
%    Output, real Y(DATA_NUM), the ordinate data.
%
  if ( prob == 1 )
    [ x, y ] = p01_dat ( data_num );
  elseif ( prob == 2 )
    [ x, y ] = p02_dat ( data_num );
  elseif ( prob == 3 )
    [ x, y ] = p03_dat ( data_num );
  elseif ( prob == 4 )
    [ x, y ] = p04_dat ( data_num );
  elseif ( prob == 5 )
    [ x, y ] = p05_dat ( data_num );
  elseif ( prob == 6 )
    [ x, y ] = p06_dat ( data_num );
  elseif ( prob == 7 )
    [ x, y ] = p07_dat ( data_num );
  elseif ( prob == 8 )
    [ x, y ] = p08_dat ( data_num );
  elseif ( prob == 9 )
    [ x, y ] = p09_dat ( data_num );
  elseif ( prob == 10 )
    [ x, y ] = p10_dat ( data_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DAT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_DAT - Fatal error!' );
  end

  return
end

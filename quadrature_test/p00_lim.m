function [ a, b ] = p00_lim ( problem, dim_num )

%*****************************************************************************80
%
%% P00_LIM returns the integration limits for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the desired test problem.
%
%    Input, integer DIM_NUM, the dimension of the argument.
%
%    Output, real A(DIM_NUM), B(DIM_NUM), the lower and upper 
%    limits of integration.
%
  if ( problem == 1 )
    [ a, b ] = p01_lim ( dim_num );
  elseif ( problem == 2 )
    [ a, b ] = p02_lim ( dim_num );
  elseif ( problem == 3 )
    [ a, b ] = p03_lim ( dim_num );
  elseif ( problem == 4 )
    [ a, b ] = p04_lim ( dim_num );
  elseif ( problem == 5 )
    [ a, b ] = p05_lim ( dim_num );
  elseif ( problem == 6 )
    [ a, b ] = p06_lim ( dim_num );
  elseif ( problem == 7 )
    [ a, b ] = p07_lim ( dim_num );
  elseif ( problem == 8 )
    [ a, b ] = p08_lim ( dim_num );
  elseif ( problem == 9 )
    [ a, b ] = p09_lim ( dim_num );
  elseif ( problem == 10 )
    [ a, b ] = p10_lim ( dim_num );
  elseif ( problem == 11 )
    [ a, b ] = p11_lim ( dim_num );
  elseif ( problem == 12 )
    [ a, b ] = p12_lim ( dim_num );
  elseif ( problem == 13 )
    [ a, b ] = p13_lim ( dim_num );
  elseif ( problem == 14 )
    [ a, b ] = p14_lim ( dim_num );
  elseif ( problem == 15 )
    [ a, b ] = p15_lim ( dim_num );
  elseif ( problem == 16 )
    [ a, b ] = p16_lim ( dim_num );
  elseif ( problem == 17 )
    [ a, b ] = p17_lim ( dim_num );
  elseif ( problem == 18 )
    [ a, b ] = p18_lim ( dim_num );
  elseif ( problem == 19 )
    [ a, b ] = p19_lim ( dim_num );
  elseif ( problem == 20 )
    [ a, b ] = p20_lim ( dim_num );
  elseif ( problem == 21 )
    [ a, b ] = p21_lim ( dim_num );
  elseif ( problem == 22 )
    [ a, b ] = p22_lim ( dim_num );
  elseif ( problem == 23 )
    [ a, b ] = p23_lim ( dim_num );
  elseif ( problem == 24 )
    [ a, b ] = p24_lim ( dim_num );
  elseif ( problem == 25 )
    [ a, b ] = p25_lim ( dim_num );
  elseif ( problem == 26 )
    [ a, b ] = p26_lim ( dim_num );
  elseif ( problem == 27 )
    [ a, b ] = p27_lim ( dim_num );
  elseif ( problem == 28 )
    [ a, b ] = p28_lim ( dim_num );
  elseif ( problem == 29 )
    [ a, b ] = p29_lim ( dim_num );
  elseif ( problem == 30 )
    [ a, b ] = p30_lim ( dim_num );
  elseif ( problem == 31 )
    [ a, b ] = p31_lim ( dim_num );
  elseif ( problem == 32 )
    [ a, b ] = p32_lim ( dim_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_LIM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_LIM - Fatal error!' );
  end

  return
end


function exact = p00_exact ( problem, dim_num )

%*****************************************************************************80
%
%% P00_EXACT returns the exact integral for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the desired test problem.
%
%    Input, integer DIM_NUM, the dimension of the problem.
%
%    Output, real EXACT, the exact value of the integral.
%
  if ( problem == 1 )
    exact = p01_exact ( dim_num );
  elseif ( problem == 2 )
    exact = p02_exact ( dim_num );
  elseif ( problem == 3 )
    exact = p03_exact ( dim_num );
  elseif ( problem == 4 )
    exact = p04_exact ( dim_num );
  elseif ( problem == 5 )
    exact = p05_exact ( dim_num );
  elseif ( problem == 6 )
    exact = p06_exact ( dim_num );
  elseif ( problem == 7 )
    exact = p07_exact ( dim_num );
  elseif ( problem == 8 )
    exact = p08_exact ( dim_num );
  elseif ( problem == 9 )
    exact = p09_exact ( dim_num );
  elseif ( problem == 10 )
    exact = p10_exact ( dim_num );
  elseif ( problem == 11 )
    exact = p11_exact ( dim_num );
  elseif ( problem == 12 )
    exact = p12_exact ( dim_num );
  elseif ( problem == 13 )
    exact = p13_exact ( dim_num );
  elseif ( problem == 14 )
    exact = p14_exact ( dim_num );
  elseif ( problem == 15 )
    exact = p15_exact ( dim_num );
  elseif ( problem == 16 )
    exact = p16_exact ( dim_num );
  elseif ( problem == 17 )
    exact = p17_exact ( dim_num );
  elseif ( problem == 18 )
    exact = p18_exact ( dim_num );
  elseif ( problem == 19 )
    exact = p19_exact ( dim_num );
  elseif ( problem == 20 )
    exact = p20_exact ( dim_num );
  elseif ( problem == 21 )
    exact = p21_exact ( dim_num );
  elseif ( problem == 22 )
    exact = p22_exact ( dim_num );
  elseif ( problem == 23 )
    exact = p23_exact ( dim_num );
  elseif ( problem == 24 )
    exact = p24_exact ( dim_num );
  elseif ( problem == 25 )
    exact = p25_exact ( dim_num );
  elseif ( problem == 26 )
    exact = p26_exact ( dim_num );
  elseif ( problem == 27 )
    exact = p27_exact ( dim_num );
  elseif ( problem == 28 )
    exact = p28_exact ( dim_num );
  elseif ( problem == 29 )
    exact = p29_exact ( dim_num );
  elseif ( problem == 30 )
    exact = p30_exact ( dim_num );
  elseif ( problem == 31 )
    exact = p31_exact ( dim_num );
  elseif ( problem == 32 )
    exact = p32_exact ( dim_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_EXACT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_EXACT - Fatal error!' );
  end

  return
end

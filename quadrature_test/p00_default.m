function p00_default ( problem, dim_num )

%*****************************************************************************80
%
%% P00_DEFAULT sets a problem to a default state.
%
%  Discussion:
%
%    If a problem uses vector parameters, then the spatial dimension
%    DIM_NUM is needed as input, so that the vector parameters can be
%    properly dimensioned.
%
%    Every problem keeps a count of the number of function calls.  Calling
%    this routine causes that count to be reset to 0.
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
%    Input, integer DIM_NUM, the dimension of the problem.
%
  if ( problem == 1 )
    p01_default ( dim_num );
  elseif ( problem == 2 )
    p02_default ( dim_num );
  elseif ( problem == 3 )
    p03_default ( dim_num );
  elseif ( problem == 4 )
    p04_default ( dim_num );
  elseif ( problem == 5 )
    p05_default ( dim_num );
  elseif ( problem == 6 )
    p06_default ( dim_num );
  elseif ( problem == 7 )
    p07_default ( dim_num );
  elseif ( problem == 8 )
    p08_default ( dim_num );
  elseif ( problem == 9 )
    p09_default ( dim_num );
  elseif ( problem == 10 )
    p10_default ( dim_num );
  elseif ( problem == 11 )
    p11_default ( dim_num );
  elseif ( problem == 12 )
    p12_default ( dim_num );
  elseif ( problem == 13 )
    p13_default ( dim_num );
  elseif ( problem == 14 )
    p14_default ( dim_num );
  elseif ( problem == 15 )
    p15_default ( dim_num );
  elseif ( problem == 16 )
    p16_default ( dim_num );
  elseif ( problem == 17 )
    p17_default ( dim_num );
  elseif ( problem == 18 )
    p18_default ( dim_num );
  elseif ( problem == 19 )
    p19_default ( dim_num );
  elseif ( problem == 20 )
    p20_default ( dim_num );
  elseif ( problem == 21 )
    p21_default ( dim_num );
  elseif ( problem == 22 )
    p22_default ( dim_num );
  elseif ( problem == 23 )
    p23_default ( dim_num );
  elseif ( problem == 24 )
    p24_default ( dim_num );
  elseif ( problem == 25 )
    p25_default ( dim_num );
  elseif ( problem == 26 )
    p26_default ( dim_num );
  elseif ( problem == 27 )
    p27_default ( dim_num );
  elseif ( problem == 28 )
    p28_default ( dim_num );
  elseif ( problem == 29 )
    p29_default ( dim_num );
  elseif ( problem == 30 )
    p30_default ( dim_num );
  elseif ( problem == 31 )
    p31_default ( dim_num );
  elseif ( problem == 32 )
    p32_default ( dim_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DEFAULT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_DEFAULT - Fatal error!' );
  end

  return
end

function fixed_num = p00_fixed_num ( test )

%*****************************************************************************80
%
%% P00_FIXED_NUM returns the number of fixed points in a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
%    Output, integer FIXED_NUM, the number of fixed points.
%
  if ( test == 1 )
    fixed_num = p01_fixed_num ( );
  elseif ( test == 2 )
    fixed_num = p02_fixed_num ( );
  elseif ( test == 3 )
    fixed_num = p03_fixed_num ( );
  elseif ( test == 4 )
    fixed_num = p04_fixed_num ( );
  elseif ( test == 5 )
    fixed_num = p05_fixed_num ( );
  elseif ( test == 6 )
    fixed_num = p06_fixed_num ( );
  elseif ( test == 7 )
    fixed_num = p07_fixed_num ( );
  elseif ( test == 8 )
    fixed_num = p08_fixed_num ( );
  elseif ( test == 9 )
    fixed_num = p09_fixed_num ( );
  elseif ( test == 10 )
    fixed_num = p10_fixed_num ( );
  elseif ( test == 11 )
    fixed_num = p11_fixed_num ( );
  elseif ( test == 12 )
    fixed_num = p12_fixed_num ( );
  elseif ( test == 13 )
    fixed_num = p13_fixed_num ( );
  elseif ( test == 14 )
    fixed_num = p14_fixed_num ( );
  elseif ( test == 15 )
    fixed_num = p15_fixed_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FIXED_NUM - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_FIXED_NUM - Fatal error!' );
  end

  return
end

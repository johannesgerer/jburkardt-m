function dim_num = p00_dim_num ( prob )

%*****************************************************************************80
%
%% P00_DIM_NUM returns the spatial dimension for any problem.
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
%    Output, integer DIM_NUM, the spatial dimension of the
%    dependent variables.
%
  if ( prob == 1 )
    dim_num = p01_dim_num ( );
  elseif ( prob == 2 )
    dim_num = p02_dim_num ( );
  elseif ( prob == 3 )
    dim_num = p03_dim_num ( );
  elseif ( prob == 4 )
    dim_num = p04_dim_num ( );
  elseif ( prob == 5 )
    dim_num = p05_dim_num ( );
  elseif ( prob == 6 )
    dim_num = p06_dim_num ( );
  elseif ( prob == 7 )
    dim_num = p07_dim_num ( );
  elseif ( prob == 8 )
    dim_num = p08_dim_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DIM_NUM - Fatal error!\n' );
    fprintf ( 1, '  Unexpected input value of PROB.\n' );
    error ( 'P00_DIM_NUM - Fatal error!' );
  end

  return
end

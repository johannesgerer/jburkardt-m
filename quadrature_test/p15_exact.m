function value = p15_exact ( dim_num )

%*****************************************************************************80
%
%% P15_EXACT returns the exact integral for problem 15.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real VALUE, the exact value of the integral.
%
  n = 0;
  n = p15_i4 ( 'G', 'N', n );

  fraction = floor ( n / dim_num );
  remainder = n - fraction * dim_num;

  value = 1.0;
  for dim = 1 : dim_num
    if ( dim <= remainder )
      value = value / ( fraction + 2 );
    else
      value = value / ( fraction + 1 );
    end
  end

  return
end

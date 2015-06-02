function value = p25_exact ( dim_num )

%*****************************************************************************80
%
%% P25_EXACT returns the exact integral for problem 25.
%
%  Discussion:
%
%    The formula in the reference seems to yield a result
%    that is too small by 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
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
  c = 0.0;
  c = p25_r8 ( 'G', 'C', c );

  roundoff = eps;

  value = 1.0;

  term = 1.0;
  i = 0;

  while ( 1 )

    i = i + 1;
    term = term * c / i;

    term2 = term / ( i + 1 )^dim_num;

    if ( abs ( term2 ) <= roundoff * ( 1.0 + abs ( value ) ) )
      break
    end

    value = value + term2;

  end

  return
end

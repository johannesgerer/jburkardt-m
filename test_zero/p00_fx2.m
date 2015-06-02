function fx2 = p00_fx2 ( prob, x )

%*****************************************************************************80
%
%% P00_FX2: second derivative of a function specified by problem number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the number of the problem.
%
%    Input, real X, the point at which F is to be evaluated.
%
%    Output, real FX2, the second derivative of the function at X.
%
  if ( prob == 1 )
    fx2 = p01_fx2 ( x );
  elseif ( prob == 2 )
    fx2 = p02_fx2 ( x );
  elseif ( prob == 3 )
    fx2 = p03_fx2 ( x );
  elseif ( prob == 4 )
    fx2 = p04_fx2 ( x );
  elseif ( prob == 5 )
    fx2 = p05_fx2 ( x );
  elseif ( prob == 6 )
    fx2 = p06_fx2 ( x );
  elseif ( prob == 7 )
    fx2 = p07_fx2 ( x );
  elseif ( prob == 8 )
    fx2 = p08_fx2 ( x );
  elseif ( prob == 9 )
    fx2 = p09_fx2 ( x );
  elseif ( prob == 10 )
    fx2 = p10_fx2 ( x );
  elseif ( prob == 11 )
    fx2 = p11_fx2 ( x );
  elseif ( prob == 12 )
    fx2 = p12_fx2 ( x );
  elseif ( prob == 13 )
    fx2 = p13_fx2 ( x );
  elseif ( prob == 14 )
    fx2 = p14_fx2 ( x );
  elseif ( prob == 15 )
    fx2 = p15_fx2 ( x );
  elseif ( prob == 16 )
    fx2 = p16_fx2 ( x );
  elseif ( prob == 17 )
    fx2 = p17_fx2 ( x );
  elseif ( prob == 18 )
    fx2 = p18_fx2 ( x );
  elseif ( prob == 19 )
    fx2 = p19_fx2 ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FX2 - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_FX2 - Fatal error!' );
  end

  return
end

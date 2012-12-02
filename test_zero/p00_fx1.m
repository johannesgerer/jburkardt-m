function fx1 = p00_fx1 ( prob, x )

%*****************************************************************************80
%
%% P00_FX1: first derivative of a function specified by problem number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
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
%    Output, real FX1, the first derivative of the function at X.
%
  if ( prob == 1 )
    fx1 = p01_fx1 ( x );
  elseif ( prob == 2 )
    fx1 = p02_fx1 ( x );
  elseif ( prob == 3 )
    fx1 = p03_fx1 ( x );
  elseif ( prob == 4 )
    fx1 = p04_fx1 ( x );
  elseif ( prob == 5 )
    fx1 = p05_fx1 ( x );
  elseif ( prob == 6 )
    fx1 = p06_fx1 ( x );
  elseif ( prob == 7 )
    fx1 = p07_fx1 ( x );
  elseif ( prob == 8 )
    fx1 = p08_fx1 ( x );
  elseif ( prob == 9 )
    fx1 = p09_fx1 ( x );
  elseif ( prob == 10 )
    fx1 = p10_fx1 ( x );
  elseif ( prob == 11 )
    fx1 = p11_fx1 ( x );
  elseif ( prob == 12 )
    fx1 = p12_fx1 ( x );
  elseif ( prob == 13 )
    fx1 = p13_fx1 ( x );
  elseif ( prob == 14 )
    fx1 = p14_fx1 ( x );
  elseif ( prob == 15 )
    fx1 = p15_fx1 ( x );
  elseif ( prob == 16 )
    fx1 = p16_fx1 ( x );
  elseif ( prob == 17 )
    fx1 = p17_fx1 ( x );
  elseif ( prob == 18 )
    fx1 = p18_fx1 ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FX1 - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_FX1 - Fatal error!' );
  end

  return
end

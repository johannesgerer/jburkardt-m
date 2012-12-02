function fx = p00_fx ( prob, x )

%*****************************************************************************80
%
%% P00_FX evaluates a function specified by problem number.
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
%    Output, real FX, the value of the function at X.
%
  if ( prob == 1 )
    fx = p01_fx ( x );
  elseif ( prob == 2 )
    fx = p02_fx ( x );
  elseif ( prob == 3 )
    fx = p03_fx ( x );
  elseif ( prob == 4 )
    fx = p04_fx ( x );
  elseif ( prob == 5 )
    fx = p05_fx ( x );
  elseif ( prob == 6 )
    fx = p06_fx ( x );
  elseif ( prob == 7 )
    fx = p07_fx ( x );
  elseif ( prob == 8 )
    fx = p08_fx ( x );
  elseif ( prob == 9 )
    fx = p09_fx ( x );
  elseif ( prob == 10 )
    fx = p10_fx ( x );
  elseif ( prob == 11 )
    fx = p11_fx ( x );
  elseif ( prob == 12 )
    fx = p12_fx ( x );
  elseif ( prob == 13 )
    fx = p13_fx ( x );
  elseif ( prob == 14 )
    fx = p14_fx ( x );
  elseif ( prob == 15 )
    fx = p15_fx ( x );
  elseif ( prob == 16 )
    fx = p16_fx ( x );
  elseif ( prob == 17 )
    fx = p17_fx ( x );
  elseif ( prob == 18 )
    fx = p18_fx ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FX - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_FX - Fatal error!' );
  end

  return
end

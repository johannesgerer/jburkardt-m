function [ value, seed ] = genz_random ( seed )

%*****************************************************************************80
%
%% GENZ_RANDOM is a portable random number generator
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 May 2007
%
%  Author:
%
%    Linus Schrage
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Linus Schrage,
%    A More Portable Fortran Random Number Generator,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 2, June 1979, pages 132-138.
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random
%    number generator.
%
%    Output, real VALUE, a pseudorandom value.
%
%    Input, integer SEED, a seed for the random
%    number generator.
%
  a = 16807;
  b15 = 32768;
  b16 = 65536;
  p = 2147483647;

  xhi = floor ( seed / b16 );
  xalo = ( seed - xhi * b16 ) * a;
  leftlo = floor ( xalo / b16 );
  fhi = xhi * a + leftlo;
  k = floor ( fhi / b15 );

  seed = ( ...
           ( ...
             ( xalo - leftlo * b16 ) - p ...
           ) ...
         + ( fhi - k * b15 ) * b16 ...
         ) + k;

  if ( seed < 0 )
    seed = seed + p;
  end

  value = seed / p;

  return
end

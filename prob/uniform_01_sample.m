function [ value, seed ] = uniform_01_sample ( seed )

%*****************************************************************************80
%
%% UNIFORM_01_SAMPLE is a portable random number generator.
%
%  Formula:
%
%    SEED = SEED * (7**5) mod ( 2**31 - 1 )
%    UNIFORM_01_SAMPLE = SEED * / ( 2**31 - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2007
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real VALUE, a random value between 0 and 1.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
%  Local parameters:
%
%    IA = 7**5
%    IB = 2**15
%    IB16 = 2**16
%    IP = 2**31-1
%
  ia = 16807;
  ib15 = 32768;
  ib16 = 65536;
  ip = 2147483647;
%
%  Don't let SEED be 0 or IP
%
  if ( seed == 0 | seed == ip )
    seed = floor ( ip / 2 );
  end
%
%  Get the 15 high order bits of SEED.
%
  ixhi = floor ( seed / ib16 );
%
%  Get the 16 low bits of SEED and form the low product.
%
  loxa = ( seed - ixhi * ib16 ) * ia;
%
%  Get the 15 high order bits of the low product.
%
  leftlo = floor ( loxa / ib16 );
%
%  Form the 31 highest bits of the full product.
%
  iprhi = ixhi * ia + leftlo;
%
%  Get overflow past the 31st bit of full product.
%
  k = floor ( iprhi / ib15 );
%
%  Assemble all the parts and presubtract IP.  The parentheses are essential.
%
  seed = ( ( ( loxa - leftlo * ib16 ) - ip ) + ( iprhi - k * ib15 ) * ib16 ) + k;
%
%  Add IP back in if necessary.
%
  if ( seed < 0 )
    seed = seed + ip;
  end
%
%  Multiply by 1 / (2**31-1).
%
  value = seed * 4.656612875E-10;

  return
end

function [ c, seed ] = i4vec_uniform_ab ( n, a, b, seed )

%*****************************************************************************80
%
%% I4VEC_UNIFORM_AB returns a scaled pseudorandom I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A, B, the minimum and maximum acceptable values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer C(N), the randomly chosen integer vector.
%
%    Output, integer SEED, the updated seed.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_UNIFORM_AB - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4VEC_UNIFORM_AB - Fatal error!' );
  end

  seed = floor ( seed );
  a = round ( a );
  b = round ( b );

  for i = 1 : n

    seed = mod ( seed, 2147483647 );

    if ( seed < 0 ) 
      seed = seed + 2147483647;
    end 

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + 2147483647;
    end

    r = seed * 4.656612875E-10;
%
%  Scale R to lie between A-0.5 and B+0.5.
%
    r = ( 1.0 - r ) * ( min ( a, b ) - 0.5 ) ...
      +         r   * ( max ( a, b ) + 0.5 );
%
%  Use rounding to convert R to an integer between A and B.
%
    value = round ( r );

    value = max ( value, min ( a, b ) );
    value = min ( value, max ( a, b ) );

    c(i) = value;

  end

  return
end

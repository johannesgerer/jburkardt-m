function [ x, seed ] = von_mises_sample ( a, b, seed )

%*****************************************************************************80
%
%% VON_MISES_SAMPLE samples the von Mises PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    D J Best and N I Fisher,
%    Efficient Simulation of the von Mises Distribution,
%    Applied Statistics,
%    Volume 28, Number 2, pages 152-157.
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    -PI <= A <= PI,
%    0.0 < B.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  tau = 1.0 + sqrt ( 1.0 + 4.0 * b * b );
  rho = ( tau - sqrt ( 2.0 * tau ) ) / ( 2.0 * b );
  r = ( 1.0 + rho * rho ) / ( 2.0 * rho );

  while ( 1 )

    [ u1, seed ] = r8_uniform_01 ( seed );
    z = cos ( pi * u1 );
    f = ( 1.0 + r * z ) / ( r + z );
    c = b * ( r - f );

    [ u2, seed ] = r8_uniform_01 ( seed );

    if ( u2 < c * ( 2.0 - c ) )
      break
    end

    if ( c <= log ( c / u2 ) + 1.0 )
      break
    end

  end

  [ u3, seed ] = r8_uniform_01 ( seed );

  if ( u3 < 0.5 )
    x = a - acos ( f );
  else
    x = a + acos ( f );
  end

  return
end

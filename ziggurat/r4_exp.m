function [ value, jsr ] = r4_exp ( jsr, ke, fe, we )

%*****************************************************************************80
%
%% R4_EXP returns an exponentially distributed single precision real value.
%
%  Discussion:
%
%    The underlying algorithm is the ziggurat method.
%
%    Before the first call to this function, the user must call R4_EXP_SETUP
%    to determine the values of KE, FE and WE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2008
%
%  Author:
%
%    Original C version by George Marsaglia, Wai Wan Tsang
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    George Marsaglia, Wai Wan Tsang,
%    The Ziggurat Method for Generating Random Variables,
%    Journal of Statistical Software,
%    Volume 5, Number 8, October 2000, seven pages.
%
%  Parameters:
%
%    Input, integer JSR, the seed.
%
%    Input, integer KE(256), data computed by R4_EXP_SETUP.
%
%    Input, real FE(256), WE(256), data computed by R4_EXP_SETUP.
%
%    Output, real R4_EXP, an exponentially distributed random value.
%
%    Output, integer JSR, the updated seed.
%
  [ jz, jsr ] = shr3 ( jsr );
  iz = bitand ( jz, uint32 ( 255 ) );

  if ( jz < ke(iz+1) )

    value = double ( jz ) * we(iz+1);

  else

    while ( 1 )

      if ( iz == 0 )
        [ u, jsr ] = r4_uni ( jsr );
        value = 7.69711 - log ( u );
        break
      end

      x = double ( jz ) * we(iz+1);

      [ u, jsr ] = r4_uni ( jsr );

      if ( fe(iz+1) + u * ( fe(iz) - fe(iz+1) ) < exp ( - x ) )
        value = x;
        break
      end

      [ jz, jsr] = shr3 ( jsr );
      iz = bitand ( jz, uint32 ( 255 ) );

      if ( jz < ke(iz+1) )
        value = double ( jz ) * we(iz+1);
        break
      end

    end

  end

  return
end

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
%    Input, uint32 JSR, the seed.
%
%    Input, uint32 KE(256), data computed by R4_EXP_SETUP.
%
%    Input, real FE(256), WE(256), data computed by R4_EXP_SETUP.
%
%    Output, real R4_EXP, an exponentially distributed random value.
%
%    Output, uint32 JSR, the updated seed.
%
  u32_max_half = uint32 ( 2147483648 );
  u32_max      = uint32 ( 4294967296 );

  [ jz, jsr ] = shr3 ( jsr );

  if ( jz < u32_max_half )
    jz_signed = jz;
  else
    jz_signed = - int32 ( u32_max - jz ) + 1;
  end

  iz = bitand ( jz, uint32 ( 255 ) );
  
  if ( abs ( jz_signed ) < ke(iz+1) )

    value = double ( abs ( jz_signed ) ) * we(iz+1);

  else

    while ( 1 )

      if ( iz == 0 )
        [ u, jsr ] = r4_uni ( jsr );
        value = 7.69711 - log ( u );
        break
      end

      x = double ( abs ( jz ) ) * we(iz+1);

      [ u, jsr ] = r4_uni ( jsr );

      if ( fe(iz+1) + u * ( fe(iz) - fe(iz+1) ) < exp ( - x ) )
        value = x;
        break
      end

      [ jz, jsr] = shr3 ( jsr );

      if ( jz < u32_max_half )
        jz_signed = jz;
      else
        jz_signed = - int32 ( u32_max - jz ) + 1;
      end

      iz = bitand ( jz, uint32 ( 255 ) );

      if ( abs ( jz_signed ) < ke(iz+1) )
        value = double ( abs ( jz_signed ) ) * we(iz+1);
        break
      end

    end

  end

  return
end

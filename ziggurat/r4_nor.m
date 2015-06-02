function [ value, jsr ] = r4_nor ( jsr, kn, fn, wn )

%*****************************************************************************80
%
%% R4_NOR returns a normally distributed single precision real value.
%
%  Discussion:
%
%    The value returned is generated from a distribution with mean 0 and
%    variance 1.
%
%    The underlying algorithm is the ziggurat method.
%
%    Before the first call to this function, the user must call R4_NOR_SETUP
%    to determine the values of KN, FN and WN.
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
%    Input, uint32 KN(128), data computed by R4_NOR_SETUP.
%
%    Input, real FN(128), WN(128), data computed by R4_NOR_SETUP.
%
%    Output, real R4_NOR, a normally distributed random value.
%
%    Output, uint32 JSR, the updated seed.
%
  r = 3.442620;
  i4_huge = uint32 ( 2147483647 );

  [ hz, jsr] = shr3 ( jsr );

  if ( i4_huge < hz )
    hz2 = double ( hz ) - double ( i4_huge ) - double ( i4_huge );
  else
    hz2 = double ( hz );
  end

  iz = bitand ( hz, uint32 ( 127 ) );

  if ( abs ( hz2 ) < kn(iz+1) )

    value = hz2 * wn(iz+1);

  else

    while ( 1 )

      if ( iz == 0 )

        while ( 1 )
          [ u, jsr ] = r4_uni ( jsr );
          x = - 0.2904764 * log ( u );
          [ u, jsr ] = r4_uni ( jsr );
          y = - log ( u );
          if ( x * x <= y + y )
            break
          end
        end

        if ( hz2 <= 0 )
          value = - r - x;
        else
          value = + r + x;
        end

        break

      end

      x = hz2 * wn(iz+1);

      [ u, jsr ] = r4_uni ( jsr );

      if ( fn(iz+1) + u * ( fn(iz) - fn(iz+1) ) < exp ( - 0.5 * x * x ) )
        value = x;
        break
      end

      [ hz, jsr ] = shr3 ( jsr );

      if ( i4_huge < hz )
        hz2 = double ( hz ) - double ( i4_huge ) - double ( i4_huge );
      else
        hz2 = double ( hz );
      end

      iz = bitand ( hz, uint32 ( 127 ) );

      if ( abs ( hz2 ) < kn(iz+1) )
        value = hz2 * wn(iz+1);
        break
      end

    end

  end

  return
end

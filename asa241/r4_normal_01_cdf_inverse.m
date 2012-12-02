function value = r4_normal_01_cdf_inverse ( p )

%*****************************************************************************80
%
%% R4_NORMAL_01_CDF_INVERSE inverts the standard normal CDF.
%
%  Discussion:
%
%    The result is accurate to about 1 part in 10**7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2004
%
%  Author:
%
%    Original FORTRAN77 version by Michael Wichura.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Michael Wichura,
%    The Percentage Points of the Normal Distribution,
%    Algorithm AS 241,
%    Applied Statistics,
%    Volume 37, Number 3, pages 477-484, 1988.
%
%  Parameters:
%
%    Input, real P, the value of the cumulative probability densitity function.
%    0 < P < 1.  If P is not in this range, an "infinite" value is returned.
%
%    Output, real VALUE, the normal deviate value with the property that
%    the probability of a standard normal deviate being less than or
%    equal to the value is P.
%
  a = [ 3.3871327179, 50.434271938, 159.29113202, 59.109374720 ];  
  b = [ 1.0, 17.895169469, 78.757757664, 67.187563600 ];
  c = [ 1.4234372777, 2.7568153900, 1.3067284816, 0.17023821103 ];
  const1 = 0.180625;
  const2 = 1.6;
  d = [ 1.0, 0.73700164250, 0.12021132975 ];
  e = [ 6.6579051150, 3.0812263860, 0.42868294337, 0.017337203997 ];
  f = [ 1.0, 0.24197894225, 0.012258202635 ];
  split1 = 0.425;
  split2 = 5.0;

  if ( p <= 0.0 )
    value = -r4_huge ( );
    return
  end

  if ( 1.0 <= p )
    value = r4_huge ( );
    return
  end 

  q = p - 0.5;

  if ( abs ( q ) <= split1 )

    r = const1 - q * q;
    value = q * r4poly_value ( 4, a, r ) / r4poly_value ( 4, b, r );

  else

    if ( q < 0.0 )
      r = p;
    else
      r = 1.0 - p;
    end

    if ( r <= 0.0 )
      value = -1.0;
      error ( 'R4_NORMAL_CDF_INVERSE - Fatal error!' );
    end

    r = sqrt ( -log ( r ) );

    if ( r <= split2 )

      r = r - const2;

      value = r4poly_value ( 4, c, r ) / r4poly_value ( 3, d, r );

    else

      r = r - split2;

      value = r4poly_value ( 4, e, r ) / r4poly_value ( 3, f, r );

    end

    if ( q < 0.0 )
      value = -value;
    end

  end

  return
end

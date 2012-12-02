function gcd = i4vec_gcd ( n, v )

%*****************************************************************************80
%
%% I4VEC_GCD returns the greatest common divisor of an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%    The value GCD returned has the property that it is the greatest integer
%    which evenly divides every entry of V.
%
%    The entries in V may be negative.
%
%    Any zero entries in V are ignored.  If all entries of V are zero,
%    GCD is returned as 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of V.
%
%    Input, integer V(N), the vector.
%
%    Output, integer GCD, the greatest common divisor of V.
%
  gcd = 0;

  for i = 1 : n

    if ( v(i) ~= 0 )
      if ( gcd == 0 )
        gcd = abs ( v(i) );
      else
        gcd = i4_gcd ( gcd, v(i) );
      end
    end

  end
%
%  If GCD is 0, that can only happen because all entries of V are zero.
%
  if ( gcd == 0 )
    gcd = 1
  end

  return
end

function [ o2, c2, e2 ] = polynomial_compress ( o, c, e )

%*****************************************************************************80
%
%% POLYNOMIAL_COMPRESS compresses a polynomial.
%
%  Discussion:
%
%    The function polynomial_sort() should be called first, or else
%    the E1 vector should be in ascending sorted order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer O, the "order" of the polynomial.
%
%    Input, real C(O), the coefficients of the polynomial.
%
%    Input, integer E(O), the indices of the exponents of the polynomial.
%
%    Output, integer O2, the "order" of the compressed polynomial.
%
%    Output, real C2(O), the coefficients of the compressed polynomial.
%
%    Output, integer E2(O), the indices of the exponents of the 
%    compressed polynomial.
%
  r8_epsilon_sqrt = sqrt ( eps );

  c2 = zeros ( o, 1 );
  e2 = zeros ( o, 1 );
%
%  Add coefficients with the same exponent.
%
  get = 0;
  put = 0;

  while ( get < o )

    get = get + 1;

    if ( 0 == put )

      put = put + 1;
      c2(put) = c(get);
      e2(put) = e(get);

    else

      if ( e2(put) == e(get) )
        c2(put) = c2(put) + c(get);
      else
        put = put + 1;
        c2(put) = c(get);
        e2(put) = e(get);
      end

    end

  end

  o = put;
!
!  Clear out zeros and tiny coefficients.
!
  get = 0;
  put = 0;

  while ( get < o )

    get = get + 1;

    if ( r8_epsilon_sqrt < abs ( c2(get) ) )
      put = put + 1;
      c2(put) = c2(get);
      e2(put) = e2(get);
    end

  end

  o2 = put;

  return
end


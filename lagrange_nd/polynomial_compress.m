function [ o, c, e ] = polynomial_compress ( o, c, e )

%*****************************************************************************80
%
%% POLYNOMIAL_COMPRESS compresses a polynomial.
%
%  Discussion:
%
%    The function polynomial_sort() should be called first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer O, the "order" of the polynomial.
%
%    Input/output, real C(O), the coefficients of the polynomial.
%
%    Input/output, integer E(O), the indices of the exponents of the polynomial.
%
  r8_epsilon_sqrt = sqrt ( eps );

  c1 = zeros ( o, 1 );
  e1 = zeros ( o, 1 );

  get = 0;
  put = 0;

  while ( get < o )

    get = get + 1;

    if ( abs ( c(get) ) <= r8_epsilon_sqrt )
      continue
    end

    if ( 0 == put )

      put = put + 1;
      c1(put) = c(get);
      e1(put) = e(get);

    else

      if ( e1(put) == e(get) )
        c1(put) = c1(put) + c(get);
      else
        put = put + 1;
        c1(put) = c(get);
        e1(put) = e(get);
      end

    end

  end
 
  o = put;
  c = c1(1:o);
  e = e1(1:o);

  return
end


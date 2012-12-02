function quad = clenshaw_curtis_integrate ( f, n )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_INTEGRATE applies a Clenshaw Curtis quadrature rule.
%
%  Discussion:
%
%    This method uses a direct approach.  The paper by Waldvogel
%    exhibits a more efficient approach using Fourier transforms.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, function F ( x ), the function to be integrated.
%
%    Input, integer N, the order of the rule.
%
%    Output, real QUAD, the estimate for the integral of F(X).
%
  if ( n < 1 )

    quad = 0.0;
    return

  end

  if ( n == 1 )

    x(1) = 0.0;
    w(1) = 2.0;
    quad = w(1) * feval ( f, x );
    return

  end

  theta(1:n) = ( 0 : n-1 ) * pi / ( n - 1 );
  x(1:n) = cos ( theta(1:n) );

  for i = 1 : n

    w(i) = 1;

    for j = 1 : floor ( ( n - 1 ) / 2 )

      if ( 2 * j == ( n - 1 ) )
        b = 1;
      else
        b = 2;
      end

      w(i) = w(i) - b * cos ( 2 * j * theta(i) ) / ( 4 * j * j - 1 );

    end
  end

  w(1)     =     w(1)     / ( n - 1 );
  w(2:n-1) = 2 * w(2:n-1) / ( n - 1 );
  w(n)     =     w(n)     / ( n - 1 );

  quad = w(1:n) * feval ( f, x )';

  return
end

function [ x, w ] = clenshaw_curtis_rule_compute ( n )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_RULE_COMPUTE computes a Clenshaw Curtis quadrature rule.
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
%    05 March 2007
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
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), W(N), the abscissas and weights of the rule.
%
  if ( n < 1 )

    x = [];
    w = [];

  elseif ( n == 1 )

    x(1) = 0.0;
    w(1) = 2.0;

  else

    theta(1:n) = ( n - 1 : -1 : 0 ) * pi / ( n - 1 );
    x(1:n) = cos ( theta(1:n) );
    w(1:n) = 1.0;

    for i = 1 : n
      for j = 1 : floor ( ( n - 1 ) / 2 )

        if ( 2 * j == ( n - 1 ) )
          b = 1.0;
        else
          b = 2.0;
        end

        w(i) = w(i) - b * cos ( 2 * j * theta(i) ) / ( 4 * j * j - 1 );

      end
    end

    w(1)     =       w(1)     / ( n - 1 );
    w(2:n-1) = 2.0 * w(2:n-1) / ( n - 1 );
    w(n)     =       w(n)     / ( n - 1 );

  end

  return
end

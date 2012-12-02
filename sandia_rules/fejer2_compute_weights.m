function w = fejer2_compute_weights ( order )

%*****************************************************************************80
%
%% FEJER2_COMPUTE_WEIGHTS computes weights for a Fejer type 2 rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2008
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
%    Walter Gautschi,
%    Numerical Quadrature in the Presence of a Singularity,
%    SIAM Journal on Numerical Analysis,
%    Volume 4, Number 3, 1967, pages 357-362.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEJER2_COMPUTE_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 1.\n' );
    error ( 'FEJER2_COMPUTE_WEIGHTS - Fatal error!' )
  end

  w = zeros ( order, 1 );
  
  if ( order == 1 )

    w(1) = 2.0;

  elseif ( order == 2 )

    w(1:2) = 1.0;

  else

    for i = 1 : order

      theta = ( order + 1 - i ) * pi / ( order + 1 );

      w(i) = 1.0;

      for j = 1 : floor ( ( order - 1 ) / 2 )
        w(i) = w(i) - 2.0 * cos ( 2.0 * j * theta ) / ( 4 * j * j - 1 );
      end

      p = 2.0 * ( floor ( ( order + 1 ) / 2 ) ) - 1.0;
      w(i) = w(i) - cos ( ( p + 1.0 ) * theta ) / p;

    end

    w(1:order) = 2.0 * w(1:order) / ( order + 1 );

  end

  return
end

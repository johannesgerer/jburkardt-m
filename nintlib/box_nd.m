function [ result, eval_num ] = box_nd ( func, dim_num, order, xtab, weight )

%*****************************************************************************80
%
%% BOX_ND estimates a multidimensional integral using a product rule.
%
%  Discussion:
%
%    The routine creates a DIM_NUM-dimensional product rule from a 1D rule
%    supplied by the user.  The routine is fairly inflexible.  If
%    you supply a rule for integration from -1 to 1, then your product
%    box must be a product of DIM_NUM copies of the interval [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2007
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
%  Parameters:
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function to be evaluated.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer ORDER, the number of points used in the 1D rule.
%
%    Input, real XTAB(ORDER), the abscissas of the 1D rule.
%
%    Input, real WEIGHT(ORDER), the weights of the 1D rule.
%
%    Output, real RESULT, the approximate value of the integral.
%
%    Output, integer EVAL_NUM, the number of function evaluations.
%
  eval_num = 0;

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BOX_ND - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1\n' );
    fprintf ( 1, '  DIM_NUM = %d\n', dim_num );
    error ( 'BOX_ND - Fatal error!' );
  end

  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BOX_ND - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 1\n' );
    fprintf ( 1, '  ORDER = %d\n', order );
    error ( 'BOX_ND - Fatal error!' );
  end

  k = 0;
  indx = [];

  result = 0.0;

  while ( 1 );

    [ k, indx ] = tuple_next ( 1, order, dim_num, k, indx );

    if ( k == 0  )
      break
    end

    w = prod ( weight(indx(1:dim_num)) );

    x(1:dim_num) = xtab(indx(1:dim_num));

    result = result + w * feval ( func, dim_num, x );
    eval_num = eval_num + 1;

  end

  return
end

function points = clenshaw_curtis_compute_points ( order )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_COMPUTE_POINTS returns the abscissas of a Clenshaw Curtis rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real POINTS(ORDER), the abscissas.
%
  if ( order < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLENSHAW_CURTIS_COMPUTE_POINTS - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'CLENSHAW_CURTIS_COMPUTE_POINTS - Fatal error!' );

  elseif ( order == 1 )

    points(1) = 0.0;

  else

    points = zeros ( order, 1 );
    angles = linspace ( pi, 0.0, order );
    points(1:order, 1 ) = cos ( angles );

    points(1) = -1.0;
    if ( mod ( order, 2 ) == 1 )
      points((order+1)/2) = 0.0;
    end
    points(order) = +1.0;

  end

  return
end

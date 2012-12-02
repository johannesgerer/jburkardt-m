function points = fejer2_compute_points ( order )

%*****************************************************************************80
%
%% FEJER2_COMPUTE_POINTS returns the abscissas of a Fejer type 2 rule.
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
%    07 October 2008
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
    fprintf ( 1, 'FEJER2_COMPUTE_POINTS - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'FEJER2_COMPUTE_POINTS - Fatal error!' );

  elseif ( order == 1 )

    points(1) = 0.0;

  else
    points = zeros ( order, 1 );

    angles = ( order : -1 : 1 ) * pi / ( order + 1 );
    points(1:order,1) = cos ( angles );

    if ( mod ( order, 2 ) == 1 )
      points((order+1)/2) = 0.0;
    end

  end

  return
end

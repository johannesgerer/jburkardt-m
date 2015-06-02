function degree = wandzura_degree ( rule )

%*****************************************************************************80
%
%% WANDZURA_DEGREE returns the degree of a given Wandzura rule for the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Wandzura, Hong Xiao,
%    Symmetric Quadrature Rules on a Triangle,
%    Computers and Mathematics with Applications,
%    Volume 45, Number 12, June 2003, pages 1829-1840.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer DEGREE, the polynomial degree of exactness of
%    the rule.
%
  if ( rule == 1 )
    degree = 5;
  elseif ( rule == 2 )
    degree = 10;
  elseif ( rule == 3 )
    degree = 15;
  elseif ( rule == 4 )
    degree = 20;
  elseif ( rule == 5 )
    degree = 25;
  elseif ( rule == 6 )
    degree = 30;
  else

    degree = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WANDZURA_DEGREE - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'WANDZURA_DEGREE - Fatal error!' )

  end

  return
end

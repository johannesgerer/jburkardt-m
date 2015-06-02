function [ x, w ] = cube_arbq ( degree, n )

%*****************************************************************************80
%
%% CUBE_ARBQ returns a quadrature rule for a cube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer DEGREE, the desired degree of exactness.
%    1 <= DEGREE <= 15.
%
%    Input, integer N, the number of points in the rule.
%    This value should be requested first from CUBE_ARBQ_SIZE.
%
%    Output, real X(3,N), the quadrature nodes.
%
%    Output, real W(N), the quadrature weights.
%
  if ( degree == 1 )
    [ x, w ] = rule01 ( n );
  elseif ( degree == 2 )
    [ x, w ] = rule02 ( n );
  elseif ( degree == 3 )
    [ x, w ] = rule03 ( n );
  elseif ( degree == 4 )
    [ x, w ] = rule04 ( n );
  elseif ( degree == 5 )
    [ x, w ] = rule05 ( n );
  elseif ( degree == 6 )
    [ x, w ] = rule06 ( n );
  elseif ( degree == 7 )
    [ x, w ] = rule07 ( n );
  elseif ( degree == 8 )
    [ x, w ] = rule08 ( n );
  elseif ( degree == 9 )
    [ x, w ] = rule09 ( n );
  elseif ( degree == 10 )
    [ x, w ] = rule10 ( n );
  elseif ( degree == 11 )
    [ x, w ] = rule11 ( n );
  elseif ( degree == 12 )
    [ x, w ] = rule12 ( n );
  elseif ( degree == 13 )
    [ x, w ] = rule13 ( n );
  elseif ( degree == 14 )
    [ x, w ] = rule14 ( n );
  elseif ( degree == 15 )
    [ x, w ] = rule15 ( n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CUBE_ARBQ - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of DEGREE.\n' );
    error ( 'CUBE_ARBQ - Fatal error!' );
  end

  d = sum ( w(1:n) );
  volume = 8.0;
  w(1:n) = w(1:n) * volume / d;

  return
end

function [ x, w ] = square_symq ( degree, n )

%*****************************************************************************80
%
%% SQUARE_SYMQ returns a symmetric quadrature rule for the square.
%
%  Discussion:
%
%    This procedure returns a quadrature rule for smooth functions
%    on the unit square [-1,1]^2.
%
%    All quadratures are accurate to 15 digits
%    All weights are positive and inside the square
%
%    The nodes are symmetrically arranged.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2014
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
%    Input, integer DEGREE, the degree of the quadrature rule.
%    1 <= DEGREE <= 20.
%
%    Input, integer N, the number of nodes.
%    This can be determined by a call to RULE_FULL_SIZE(DEGREE).
%
%    Output, real X(2,N), the coordinates of the nodes.
%
%    Output, real W(N), the weights.
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
  elseif ( degree == 16 )
    [ x, w ] = rule16 ( n );
  elseif ( degree == 17 )
    [ x, w ] = rule17 ( n );
  elseif ( degree == 18 )
    [ x, w ] = rule18 ( n );
  elseif ( degree == 19 )
    [ x, w ] = rule19 ( n );
  elseif ( degree == 20 )
    [ x, w ] = rule20 ( n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SQUARESYMVQ - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of DEGREE.\n' );
    error ( 'SQUARE_SYMQ - Fatal error!' );
  end

  w_sum = sum ( w(1:n) );

  w(1:n) = 4.0 * w(1:n) / w_sum;

  return
end
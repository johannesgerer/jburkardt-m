function [ bb, bx ] = quadbf ( x, it, in, xc, node )

%*****************************************************************************80
%
%% QUADBF evaluates the quadratic basis functions and derivatives.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2006
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Input, integer IT, the element in which X lies.
%
%    Input, integer IN, the node associated with the basis function.
%
%    Input, real XC(*), the coordinates of the nodes.
%
%    Input, integer NODE(ELEMENT_NUM,3), the nodes that make up
%    each element.
%
%    Output, real BB, BX, the values of the basis function and its
%    derivative with respect to X.
% 
  in1 = in;
  in2 = mod ( in, 3 ) + 1;
  in3 = mod ( in + 1, 3 ) + 1;

  i1 = node(it,in1);
  i2 = node(it,in2);
  i3 = node(it,in3);

  den = ( xc(i3) - xc(i1) ) * ( xc(i2) - xc(i1) );

  bb = ( xc(i3) - x ) * ( xc(i2) - x ) / den;

  bx = ( 2.0 * x - xc(i2) - xc(i3) ) / den; 

  return
end

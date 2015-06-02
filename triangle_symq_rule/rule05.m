function [ x, y, w ] = rule05 ( )

%*****************************************************************************80
%
%% RULE05 returns the rule of degree 5.
%
%  Discussion:
%
%    Order 5 (7 pts)
%    1/6 data for 5-th order quadrature with 3 nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Output, real X(*), Y(*), the coordinates of the nodes.
%
%    Output, real W(*), the weights.
%
  x = [ ...
       0.00000000000000000000000000000000, ...
       0.00000000000000000000000000000000, ...
       0.00000000000000000000000000000000 ];
  y = [ ...
       0.80383378476840441740523498549521, ...
      -0.47391934523147540911429282520838, ...
       0.00000000000000000000000000000000 ];
  w = [ ...
       0.82872641363789568276918148034109E-01, ...
       0.87120251975907374578897626781336E-01, ...
       0.49352775485718467280720708817387E-01 ];

  return
end